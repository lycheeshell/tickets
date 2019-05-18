package edu.nju.tickets.controller;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.mail.MessagingException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
    
}  