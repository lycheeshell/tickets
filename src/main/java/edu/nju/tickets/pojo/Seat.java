package edu.nju.tickets.pojo;

public class Seat {
	
	private int id;
	private Show show;
	private String name;
	private int amount;
	private int price;
	
	@Override
	public String toString() {
		return "Seat [id=" + id + ", name=" + name + ", amount=" + amount + ", price=" + price + "]";
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Show getShow() {
		return show;
	}
	public void setShow(Show show) {
		this.show = show;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	
}
