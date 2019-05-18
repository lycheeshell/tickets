package edu.nju.tickets.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.nju.tickets.pojo.Manager;
import edu.nju.tickets.pojo.Venue;
import edu.nju.tickets.service.ManagerService;

@Controller  
@RequestMapping("/manager") 
public class ManagerController {
	
	@Resource  
    private ManagerService managerService;
    
    /**注册
     * 
     */
    @ResponseBody
    @RequestMapping(value= "/register.action",method=RequestMethod.POST)
    public int register(Manager manager) {
    	System.out.println(manager);
        return managerService.register(manager);
    }
    
    /**登录
     * 
     * @param manager
     * @return 
     */
    @ResponseBody
    @RequestMapping(value="/login.action", method=RequestMethod.POST)
    public int login(Manager manager) {
    	System.out.println(manager);
        return managerService.login(manager);
    }
    
    /**获取处于待审核状态的场馆
     * 
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/getVenues.action", method=RequestMethod.POST)
    public List<Venue> getVenues() {
    	List<Venue> list = managerService.getVenues();
    	System.out.println(list);
        return list;
    }
    
    /**同意场馆申请
     * 
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/agreeVenue.action", method=RequestMethod.POST)
    public int agreeVenue(int id) {
        return managerService.agreeVenue(id);
    }
    
    /**删除场馆
     * 
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/deleteVenue.action", method=RequestMethod.POST)
    public int deleteVenue(int id) {
        return managerService.deleteVenue(id);
    }
	
}
