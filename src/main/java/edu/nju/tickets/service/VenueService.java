package edu.nju.tickets.service;

import edu.nju.tickets.pojo.Venue;

public interface VenueService {  
	
	public int register(Venue venue);
	
	public Venue login(Venue venue);
	
	public Venue getVenueInfo(int id);

	public int modifyVenue(Venue venue);
	
}  