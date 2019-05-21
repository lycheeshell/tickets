package edu.nju.tickets.pojo;

import java.sql.Timestamp;

public class Order {
	
	private int id;
	private User user;
	private Show show;
	private Coupon coupon;
	private String seat;
	private int amount;
	private int price;
	private Timestamp starttime;
	private Timestamp paytime;
	private int state;  //1：未使用；  2：已使用；  3：已退款；  4：未付款；  5：已失效
	
	@Override
	public String toString() {
		return "Order [id=" + id + ", seat=" + seat + ", amount=" + amount + ", price=" + price + ", starttime="
				+ starttime + ", paytime=" + paytime + ", state=" + state + "]";
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Show getShow() {
		return show;
	}
	public void setShow(Show show) {
		this.show = show;
	}
	public Coupon getCoupon() {
		return coupon;
	}
	public void setCoupon(Coupon coupon) {
		this.coupon = coupon;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Timestamp getStarttime() {
		return starttime;
	}
	public void setStarttime(Timestamp starttime) {
		this.starttime = starttime;
	}
	public Timestamp getPaytime() {
		return paytime;
	}
	public void setPaytime(Timestamp paytime) {
		this.paytime = paytime;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
}
