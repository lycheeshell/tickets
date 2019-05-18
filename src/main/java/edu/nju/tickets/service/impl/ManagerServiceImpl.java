package edu.nju.tickets.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import edu.nju.tickets.mapper.ManagerMapper;
import edu.nju.tickets.pojo.Manager;
import edu.nju.tickets.pojo.Venue;
import edu.nju.tickets.service.ManagerService;

@Service("managerService")  
public class ManagerServiceImpl implements ManagerService {
	
	@Resource  
    private ManagerMapper managerMapper;  

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

}
