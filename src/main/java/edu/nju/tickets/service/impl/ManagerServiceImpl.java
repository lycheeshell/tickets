package edu.nju.tickets.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import edu.nju.tickets.mapper.ManagerMapper;
import edu.nju.tickets.mapper.OrderMapper;
import edu.nju.tickets.mapper.ShowMapper;
import edu.nju.tickets.mapper.VenueMapper;
import edu.nju.tickets.pojo.Manager;
import edu.nju.tickets.pojo.Show;
import edu.nju.tickets.pojo.Venue;
import edu.nju.tickets.service.ManagerService;

@Service("managerService")  
public class ManagerServiceImpl implements ManagerService {
	
	@Resource  
    private ManagerMapper managerMapper;
	@Resource  
    private ShowMapper showMapper;
	@Resource  
    private OrderMapper orderMapper;
	@Resource  
    private VenueMapper venueMapper;

	@Override
	public int register(Manager manager) {
		if(managerMapper.getManagerNumber(manager.getAccount()) >= 1) {
			return -1;
		}
		return managerMapper.addManager(manager);
	}

	@Override
	public int login(Manager manager) {
		return managerMapper.login(manager);
	}

	@Override
	public List<Venue> getVenues() {
		return managerMapper.getVenues();
	}

	@Override
	public int agreeVenue(int id) {
		return managerMapper.agreeVenue(id);
	}

	@Override
	public int deleteVenue(int id) {
		return managerMapper.deleteVenue(id);
	}

	@Override
	public List<Show> getShows() {
		return showMapper.getFinishedShows();
	}

	@Override
	public Map<String, String> getMoneyInfo(int showid) {
		Map<String, String> map = new HashMap<String, String>();
		String name = showMapper.getNameById(showid);
		map.put("name", name);
		int money = orderMapper.getTotalMoney(showid);
		map.put("money", "" + money);
		return map;
	}

	@Override
	public int settleShow(int showid, int money) {
		return venueMapper.settleShow(showid, money);
	}

}
