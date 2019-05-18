package edu.nju.tickets.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.nju.tickets.pojo.Venue;
import edu.nju.tickets.service.VenueService;
import edu.nju.tickets.util.UuidUtil;

@Controller  
@RequestMapping("/venue") 
public class VenueController {
	
	@Resource  
    private VenueService venueService;
	
	/**获取7位唯一账户
     * 
     */
    @ResponseBody
    @RequestMapping(value= "/getAccount.action",method=RequestMethod.POST)
    public String getAccount() {
    	String account = UuidUtil.generateShortUuid();
    	System.out.println(account);
        return account;
    }
    
    /**注册
     * 
     */
    @ResponseBody
    @RequestMapping(value= "/register.action",method=RequestMethod.POST)
    public int register(Venue venue) {
    	System.out.println(venue);
        return venueService.register(venue);
    }
    
    /**登录
     * 
     * @param manager
     * @return 
     */
    @ResponseBody
    @RequestMapping(value="/login.action", method=RequestMethod.POST)
    public Venue login(Venue venue) {
    	System.out.println(venue);
    	Venue v = venueService.login(venue);
    	System.out.println(v);
        return v;
    }
    
    /**根据场馆id获取场馆信息
     * 
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/getVenueInfo.action", method=RequestMethod.POST)
    public Venue getVenueInfo(int id) {
    	Venue v = venueService.getVenueInfo(id);
    	System.out.println(v);
        return v;
    }
    
    /**修改场馆信息
     * 
     * @param venue
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/modifyVenue.action", method=RequestMethod.POST)
    public int modifyVenue(Venue venue) {
    	System.out.println(venue);
    	return venueService.modifyVenue(venue);
    }
	
}
