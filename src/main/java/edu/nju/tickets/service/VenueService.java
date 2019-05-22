package edu.nju.tickets.service;

import java.util.List;

import edu.nju.tickets.pojo.Order;
import edu.nju.tickets.pojo.Seat;
import edu.nju.tickets.pojo.Show;
import edu.nju.tickets.pojo.Venue;

public interface VenueService {  
	
	public int register(Venue venue);
	
	public Venue login(Venue venue);
	
	public Venue getVenueInfo(int id);

	public int modifyVenue(Venue venue);

	public int addShow(String showName, int venueid, String showType, String showTime, String showDescription);

	public int addSeat(int venueid, int showid, String name, int amount, int price);

	public List<Show> getShows(int id);

	public List<Seat> getSeats(int showid);

	public int sellTicket(int seatid);

	public List<Order> getShowOrdersByUser(String userAccount, int showid);

	public int checkTicket(int orderid);
	
}  