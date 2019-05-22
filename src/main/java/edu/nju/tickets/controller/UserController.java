package edu.nju.tickets.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.nju.tickets.pojo.Coupon;
import edu.nju.tickets.pojo.Order;
import edu.nju.tickets.pojo.Seat;
import edu.nju.tickets.pojo.Show;
import edu.nju.tickets.pojo.User;
import edu.nju.tickets.service.UserService;

@Controller  
@RequestMapping("/user")  
public class UserController {  
      
    @Resource  
    private UserService userService;
    
    /**注册
     * 
     * @throws MessagingException 
     * @throws UnsupportedEncodingException 
     */
    @ResponseBody
    @RequestMapping(value= "/register.action",method=RequestMethod.POST)
    public int register(User user) throws UnsupportedEncodingException, MessagingException{
    	System.out.println(user);
        return userService.register(user);
    }
    
    /**验证邮箱
     * 
     * @param account
     * @return
     */
    @RequestMapping(value="/confirmEmail", method=RequestMethod.GET)
    public String confirmEmail(String account) {
    	if(userService.confirmEmail(account) == 1) {
    		return "user/login";
    	}
        return "error";
    }
    
    /**登录
     * 
     * @param user
     * @return 
     */
    @ResponseBody
    @RequestMapping(value="/login.action", method=RequestMethod.POST)
    public User login(User user) {
    	System.out.println(user);
    	User u = userService.login(user);
    	System.out.println(u);
        return u;
    }
    
    /**根据id获取用户
     * 
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value= "/getUserInfo.action",method=RequestMethod.POST)
    public User getUserInfo(int id) {
        return userService.getUserInfo(id);
    }
    
    /**修改会员信息
     * 
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping(value= "/modifyUser.action",method=RequestMethod.POST)
    public int modifyUser(User user) {
    	System.out.println(user);
        return userService.modifyUser(user);
    }
    
    /**永久注销用户
     * 
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value= "/dropUser.action",method=RequestMethod.POST)
    public int dropUser(int id) {
        return userService.dropUser(id);
    }
    
    /**用户充值
     * 
     * @param id
     * @param moneyToAdd
     * @return
     */
    @ResponseBody
    @RequestMapping(value= "/addMoney.action",method=RequestMethod.POST)
    public int addMoney(int id, int moneyToAdd) {
        return userService.addMoney(id, moneyToAdd);
    }
    
    /**兑换优惠券
     * 
     * @param id
     * @param coupon
     * @return
     */
    @ResponseBody
    @RequestMapping(value= "/addCoupon.action",method=RequestMethod.POST)
    public int addCoupon(int id, int coupon) {
        return userService.addCoupon(id, coupon);
    }
    
    /**获取用户的优惠券
     * 
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/getCoupons.action", method=RequestMethod.POST)
    public List<Coupon> getCoupons(int id) {
    	List<Coupon> list = userService.getCoupons(id);
    	System.out.println(list);
        return list;
    }
    
    /**获取在售演出
     * 
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/getShows.action", method=RequestMethod.POST)
    public List<Show> getShows() {
    	List<Show> list = userService.getShows();
    	System.out.println(list);
        return list;
    }
    
    /**获取演出的剩余座位
     * 
     * @param showid
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/getSeats.action", method=RequestMethod.POST)
    public List<Seat> getSeats(int showid) {
    	List<Seat> list = userService.getSeats(showid);
    	System.out.println(list);
        return list;
    }
    
    /**预订演出票（未支付）
     * 
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/buyTicket.action",method=RequestMethod.POST)
    public int buyTicket(HttpServletRequest request){
    	int userid = Integer.parseInt(request.getParameter("userid"));
    	int showid = Integer.parseInt(request.getParameter("showid"));
    	int couponid = 0;
    	if(request.getParameter("couponid") == null || request.getParameter("couponid").equals("")) {
    		couponid = 0;
    	} else {
    		couponid = Integer.parseInt(request.getParameter("couponid"));
    	}
    	String seat = request.getParameter("seat");
        int amount = Integer.parseInt(request.getParameter("amount"));
        int price = Integer.parseInt(request.getParameter("price"));
        
    	return userService.addBuyTicket(userid, showid, couponid, seat, amount, price);
    }
    
    /**获取未支付订单
     * 
     * @param id
     * @param showid
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/getUnpayedOrders.action", method=RequestMethod.POST)
    public List<Order> getUnpayedOrders(int id, int showid) {
    	List<Order> list = userService.getUnpayedOrders(id, showid);
    	System.out.println(list);
        return list;
    }
    
    /**支付演出票
     * 
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/payTicket.action",method=RequestMethod.POST)
    public int payTicket(HttpServletRequest request){
    	int userid = Integer.parseInt(request.getParameter("userid"));
    	int orderid = Integer.parseInt(request.getParameter("orderid"));
        int orderPrice = Integer.parseInt(request.getParameter("orderPrice"));
        
    	return userService.payTicket(userid, orderid, orderPrice);
    }
    
    /**获取用户所有的订单
     * 
     * @param id
     * @param showid
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/getUserAllOrders.action", method=RequestMethod.POST)
    public List<Order> getUserAllOrders(int id) {
    	List<Order> list = userService.getUserAllOrders(id);
    	System.out.println(list);
        return list;
    }
    
    /**退演出票
     * 
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/refundTicket.action",method=RequestMethod.POST)
    public int refundTicket(HttpServletRequest request){
    	int userid = Integer.parseInt(request.getParameter("userid"));
    	int orderid = Integer.parseInt(request.getParameter("orderid"));
        int orderPrice = Integer.parseInt(request.getParameter("orderPrice"));
        
    	return userService.refundTicket(userid, orderid, orderPrice);
    }
    
}  