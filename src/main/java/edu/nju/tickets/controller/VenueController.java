package edu.nju.tickets.controller;

import java.io.FileOutputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import edu.nju.tickets.pojo.Venue;
import edu.nju.tickets.service.VenueService;
import edu.nju.tickets.util.StringUtil;
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
    
    /**发布演出
     * 
     * @param request
     * @return 演出的showid
     */
    @ResponseBody
    @RequestMapping(value="/addShow.action",method=RequestMethod.POST)
    public int addShow(HttpServletRequest request){
    	String showName = request.getParameter("showName");
        int venueid = Integer.parseInt(request.getParameter("venueid"));
        String showType = request.getParameter("showType");
        String showTime = request.getParameter("showTime");
        showTime = showTime.replace('T', ' ');
        String showDescription = request.getParameter("showDescription");
        
        upload(request, showName + "venue" + venueid, "venue");
        
        return venueService.addShow(showName, venueid, showType, showTime, showDescription);
    }
    
    /**上传演出图片
     * 
     * @param req
     * @param fileName
     * @param packageName
     */
    public void upload(HttpServletRequest req, String fileName, String packageName){
        MultipartHttpServletRequest mreq = (MultipartHttpServletRequest)req;
        MultipartFile file = mreq.getFile("file");
        if(file == null){                           //没有上传图片
            return;
        }
        String fileType = file.getOriginalFilename();
        if(!StringUtil.checkObj(fileType)){                           //没有上传图片
            return;
        }
        
        try {
        	FileOutputStream fos = new FileOutputStream(req.getSession().getServletContext().getRealPath("/")+
                    "dist/images/"+packageName+"/"+fileName+fileType.substring(fileType.lastIndexOf('.')).toLowerCase());
            fos.write(file.getBytes());
            fos.flush();
            fos.close();
        }catch (Exception e){
        	e.printStackTrace();
        }
        
    }
    
    /**添加演出的座位
     * 
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/addSeat.action",method=RequestMethod.POST)
    public int addSeat(HttpServletRequest request){
    	int venueid = Integer.parseInt(request.getParameter("venueid"));
    	int showid = Integer.parseInt(request.getParameter("showid"));
    	String name = request.getParameter("name");
        int amount = Integer.parseInt(request.getParameter("amount"));
        int price = Integer.parseInt(request.getParameter("price"));
        
        return venueService.addSeat(venueid, showid, name, amount, price);
    }
	
}
