package edu.nju.tickets.pojo;

public class Venue {
	
	private int id;
    private String account;
    private String password;
    private String name;
    private String location;
    private String phone;
    private int seat;  //座位数
    private int money;
    private int state;  //1：正常；   0：待审核；   2：修改信息待审核
    
	@Override
	public String toString() {
		return "Venue [id=" + id + ", account=" + account + ", password=" + password + ", name=" + name + ", location="
				+ location + ", phone=" + phone + ", seat=" + seat + ", money=" + money + ", state=" + state + "]";
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getSeat() {
		return seat;
	}
	public void setSeat(int seat) {
		this.seat = seat;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
}
