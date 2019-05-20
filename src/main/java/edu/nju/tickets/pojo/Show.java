package edu.nju.tickets.pojo;

import java.sql.Timestamp;

public class Show {
	
	private int id;
	private Venue venue;
	private String name;
	private Timestamp showtime;
	private String type;
	private String description;
	
	@Override
	public String toString() {
		return "Show [id=" + id + ", name=" + name + ", showtime=" + showtime + ", type=" + type + ", description="
				+ description + "]";
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Venue getVenue() {
		return venue;
	}
	public void setVenue(Venue venue) {
		this.venue = venue;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Timestamp getShowtime() {
		return showtime;
	}
	public void setShowtime(Timestamp showtime) {
		this.showtime = showtime;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
}
