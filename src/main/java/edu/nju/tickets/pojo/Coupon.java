package edu.nju.tickets.pojo;

import java.sql.Timestamp;

public class Coupon {
	
	private int id;
	private User user;
	private int amount;
	private Timestamp endtime;
	private int state;    // 1：未使用；  0：已使用
	
	@Override
	public String toString() {
		return "Coupon [id=" + id + ", amount=" + amount + ", endtime=" + endtime + "]";
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
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Timestamp getEndtime() {
		return endtime;
	}
	public void setEndtime(Timestamp endtime) {
		this.endtime = endtime;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
}
