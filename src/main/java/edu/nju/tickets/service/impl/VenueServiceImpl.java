package edu.nju.tickets.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import edu.nju.tickets.mapper.VenueMapper;
import edu.nju.tickets.pojo.Venue;
import edu.nju.tickets.service.VenueService;

@Service("venueService")  
public class VenueServiceImpl implements VenueService {
	
	@Resource  
    private VenueMapper venueMapper;  

	@Override
	public int register(Venue venue) {
		if(venueMapper.getManagerNumber(venue.getAccount()) >= 1) {
			return -1;
		}
		return venueMapper.addManager(venue);
	}

	@Override
	public Venue login(Venue venue) {
		return venueMapper.login(venue);
	}

	@Override
	public Venue getVenueInfo(int id) {
		return venueMapper.getVenueInfo(id);
	}

	@Override
	public int modifyVenue(Venue venue) {
		return venueMapper.modifyVenue(venue);
	}

}
