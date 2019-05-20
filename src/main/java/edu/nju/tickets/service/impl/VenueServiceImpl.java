package edu.nju.tickets.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.nju.tickets.mapper.ShowMapper;
import edu.nju.tickets.mapper.VenueMapper;
import edu.nju.tickets.pojo.Venue;
import edu.nju.tickets.service.VenueService;

@Service("venueService")  
public class VenueServiceImpl implements VenueService {
	
	@Resource  
    private VenueMapper venueMapper;
	@Resource  
    private ShowMapper showMapper;  

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

	@Transactional(rollbackFor=Exception.class)
	@Override
	public int addShow(String showName, int venueid, String showType, String showTime, String showDescription) {
		int showNum = showMapper.addShow(showName, venueid, showType, showTime, showDescription);
		if(showNum == 0) {
			return 0;
		}
		return showMapper.getLastShowId();
	}

	@Transactional(rollbackFor=Exception.class)
	@Override
	public int addSeat(int venueid, int showid, String name, int amount, int price) {
		int nameCount = showMapper.getSeatNumByName(showid, name);
		if(nameCount > 0) {
			return -1;
		}
		int venueSeatNum = venueMapper.getSeatNum(venueid);
		int totalSeatNum = showMapper.getTotalSeatNum(showid) + amount;
		if(venueSeatNum < totalSeatNum) {
			return -2;
		}
		
		return showMapper.addSeat(showid, name, amount, price);
	}

}
