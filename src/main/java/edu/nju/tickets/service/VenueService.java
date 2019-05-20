package edu.nju.tickets.service;

import edu.nju.tickets.pojo.Venue;

public interface VenueService {  
	
	public int register(Venue venue);
	
	public Venue login(Venue venue);
	
	public Venue getVenueInfo(int id);

	public int modifyVenue(Venue venue);

	public int addShow(String showName, int venueid, String showType, String showTime, String showDescription);

	public int addSeat(int venueid, int showid, String name, int amount, int price);
	
}  