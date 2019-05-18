package edu.nju.tickets.test;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import edu.nju.tickets.pojo.User;
import edu.nju.tickets.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类  
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})  
public class TestTickets {
	
	@Resource  
    private UserService userService;
    
    @Test  
    public void test1() {  
    	User user = new User();
    	user.setAccount("aaa");
    	user.setPassword("aaa");
        User num = userService.login(user);
        System.out.println(num);  
    }
	
}
