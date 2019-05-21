package edu.nju.tickets.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.mail.MessagingException;

import edu.nju.tickets.pojo.Coupon;
import edu.nju.tickets.pojo.Order;
import edu.nju.tickets.pojo.Seat;
import edu.nju.tickets.pojo.Show;
import edu.nju.tickets.pojo.User;

public interface UserService {  
	
	public int register(User user) throws UnsupportedEncodingException, MessagingException;
	
	public int confirmEmail(String account);
	
	public User login(User user);

	public User getUserInfo(int id);

	public int modifyUser(User user);

	public int dropUser(int id);

	public int addMoney(int id, int moneyToAdd);

	public int addCoupon(int id, int coupon);

	public List<Coupon> getCoupons(int userid);

	public List<Show> getShows();

	public List<Seat> getSeats(int showid);

	public int addBuyTicket(int userid, int showid, int couponid, String seat, int amount, int price);

	public List<Order> getUnpayedOrders(int id, int showid);

	public int payTicket(int userid, int orderid, int orderPrice);
	
}  