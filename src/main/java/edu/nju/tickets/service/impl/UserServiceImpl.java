package edu.nju.tickets.service.impl;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.mail.MessagingException;

import org.apache.ibatis.jdbc.RuntimeSqlException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.nju.tickets.mapper.CouponMapper;
import edu.nju.tickets.mapper.OrderMapper;
import edu.nju.tickets.mapper.ShowMapper;
import edu.nju.tickets.mapper.UserMapper;
import edu.nju.tickets.pojo.Coupon;
import edu.nju.tickets.pojo.Order;
import edu.nju.tickets.pojo.Seat;
import edu.nju.tickets.pojo.Show;
import edu.nju.tickets.pojo.User;
import edu.nju.tickets.service.UserService;
import edu.nju.tickets.util.MailUtil;  

@Service("userService")  
public class UserServiceImpl implements UserService {
	
    @Resource  
    private UserMapper userMapper;
    @Resource  
    private CouponMapper couponMapper;
    @Resource  
    private ShowMapper showMapper;
    @Resource  
    private OrderMapper orderMapper;

	@Override
	public int register(User user) throws UnsupportedEncodingException, MessagingException {
		if(userMapper.getInactiveUserNumber(user.getAccount()) == 1){
			userMapper.updateRegisterUser(user);
			MailUtil.sendMail(user.getEmail(), "tickets验证码", "http://localhost:8080/tickets/user/confirmEmail?account=" + user.getAccount());
			return 1;
		}
		if(userMapper.getUserNumber(user.getAccount()) >= 1) {
			return -1;
		}
		if(userMapper.addUser(user) == 1) {
			MailUtil.sendMail(user.getEmail(), "tickets验证码", "http://localhost:8080/tickets/user/confirmEmail?account=" + user.getAccount());
			return 1;
		}
		return 0;
	}

	@Override
	public int confirmEmail(String account) {
		return userMapper.confirmEmail(account);
	}

	@Override
	public User login(User user) {
		return userMapper.login(user);
	}

	@Override
	public User getUserInfo(int id) {
		return userMapper.getUserInfo(id);
	}

	@Override
	public int modifyUser(User user) {
		return userMapper.modifyUser(user);
	}

	@Override
	public int dropUser(int id) {
		return userMapper.dropUser(id);
	}

	@Override
	public int addMoney(int id, int moneyToAdd) {
		return userMapper.addMoney(id, moneyToAdd);
	}

	@Transactional(rollbackFor=Exception.class)
	@Override
	public int addCoupon(int id, int coupon) {
		int updateUser = userMapper.updateUserScore(id, coupon);
		int insertCoupon = couponMapper.addCoupon(id, coupon);
		if(updateUser == 1 && insertCoupon ==1) {
			return 1;
		} else {
			throw new RuntimeSqlException("添加优惠券出现异常");
		}
	}

	@Override
	public List<Coupon> getCoupons(int userid) {
		return couponMapper.getCoupons(userid);
	}

	@Override
	public List<Show> getShows() {
		return showMapper.getUserShows();
	}

	@Override
	public List<Seat> getSeats(int showid) {
		return showMapper.getSeats(showid);
	}

	@Transactional(rollbackFor=Exception.class)
	@Override
	public int addBuyTicket(int userid, int showid, int couponid, String seat, int amount, int price) {
		int beforeNum = showMapper.getAmountByShowidAndSeat(showid, seat);
		int sell = showMapper.updateSeatByShowidAndSeat(showid, seat, amount);
		int order = 0;
		int coupon = 1;
		if(couponid != 0) {
			coupon = couponMapper.updateCouponState(couponid);
			order = orderMapper.addOrder(userid, showid, couponid, seat, amount, price);
		} else {
			order = orderMapper.addOrderwithoutCoupon(userid, showid, couponid, seat, amount, price);
		}
		if(beforeNum == 0) {
			throw new RuntimeSqlException("没有足够余票");
		}
		if(sell == 1 && order == 1 && coupon ==1) {
			return 1;
		}
		return 0;
	}

	@Override
	public List<Order> getUnpayedOrders(int id, int showid) {
		return orderMapper.getUnpayedOrders(id, showid);
	}

	@Transactional(rollbackFor=Exception.class)
	@Override
	public int payTicket(int userid, int orderid, int orderPrice) {
		int userMoney = userMapper.getUserMoney(userid);
		if(userMoney < orderPrice) {
			return -1;
		}
		int order = orderMapper.updateOrderPay(orderid);
		if(order != 1) {
			throw new RuntimeSqlException("更新订单失败");
		}
		int allMoney = orderMapper.getAllMoneyByUser(userid);
		allMoney = allMoney + orderPrice;
		
		int level = 0;
		if(allMoney < 500) { 
			level = 1;
		} else if(allMoney < 1000) {
			level = 2;
		} else if(allMoney < 2000) {
			level = 3;
		} else if(allMoney < 5000) {
			level = 4;
		} else if(allMoney < 10000) {
			level = 5;
		}
		
		int user = userMapper.updateByPay(userid, orderPrice, level);
		if(user != 1) {
			throw new RuntimeSqlException("更新用户余额失败");
		} else {
			return 1;
		}
	}

	@Override
	public List<Order> getUserAllOrders(int id) {
		return orderMapper.getUserAllOrders(id);
	}

	@Transactional(rollbackFor=Exception.class)
	@Override
	public int refundTicket(int userid, int orderid, int orderPrice) {
		int order = orderMapper.updateOrderRefund(orderid);
		if(order != 1) {
			throw new RuntimeSqlException("更新订单失败");
		}
		int allMoney = orderMapper.getAllMoneyByUser(userid);
		
		int level = 0;
		if(allMoney < 500) { 
			level = 1;
		} else if(allMoney < 1000) {
			level = 2;
		} else if(allMoney < 2000) {
			level = 3;
		} else if(allMoney < 5000) {
			level = 4;
		} else if(allMoney < 10000) {
			level = 5;
		}
		
		int user = userMapper.updateByRefund(userid, orderPrice, level);
		if(user != 1) {
			throw new RuntimeSqlException("更新用户余额失败");
		} else {
			return 1;
		}
	}
  
} 
