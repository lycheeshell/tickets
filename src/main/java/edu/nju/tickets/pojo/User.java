package edu.nju.tickets.pojo;

public class User {
	
    private int id;
    private String account;
    private String email;
    private String password;
    private String name;
    private int money;
    private int score;  //积分
    private int level;
    private int state;  // 1：正常的会员；0：注销的会员；2：未激活
    
	@Override
	public String toString() {
		return "User [id=" + id + ", account=" + account + ", email=" + email + ", password=" + password + ", name="
				+ name + ", money=" + money + ", score=" + score + ", level=" + level + ", state=" + state + "]";
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
    
}