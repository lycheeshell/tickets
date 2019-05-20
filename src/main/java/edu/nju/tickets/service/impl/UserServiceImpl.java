package edu.nju.tickets.service.impl;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.mail.MessagingException;

import org.apache.ibatis.jdbc.RuntimeSqlException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.nju.tickets.mapper.CouponMapper;
import edu.nju.tickets.mapper.UserMapper;
import edu.nju.tickets.pojo.Coupon;
import edu.nju.tickets.pojo.User;
import edu.nju.tickets.service.UserService;
import edu.nju.tickets.util.MailUtil;  

@Service("userService")  
public class UserServiceImpl implements UserService {
	
    @Resource  
    private UserMapper userMapper;
    @Resource  
    private CouponMapper couponMapper;  

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
  
} 
