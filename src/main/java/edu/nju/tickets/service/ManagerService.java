package edu.nju.tickets.service;

import java.util.List;
import java.util.Map;

import edu.nju.tickets.pojo.Manager;
import edu.nju.tickets.pojo.Show;
import edu.nju.tickets.pojo.Venue;

public interface ManagerService {

	public int register(Manager manager);
	
	public int login(Manager manager);
	
	public List<Venue> getVenues();

	public int agreeVenue(int id);

	public int deleteVenue(int id);

	public List<Show> getShows();

	public Map<String, String> getMoneyInfo(int showid);

	public int settleShow(int showid, int money);
	
}
