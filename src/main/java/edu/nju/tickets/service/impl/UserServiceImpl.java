package edu.nju.tickets.service.impl;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.mail.MessagingException;

import org.springframework.stereotype.Service;

import edu.nju.tickets.mapper.UserMapper;
import edu.nju.tickets.pojo.User;
import edu.nju.tickets.service.UserService;
import edu.nju.tickets.util.MailUtil;  

@Service("userService")  
public class UserServiceImpl implements UserService {  
    @Resource  
    private UserMapper userMapper;  

	@Override
	public int register(User user) throws UnsupportedEncodingException, MessagingException {
		if(userMapper.getInactiveUserNumber(user.getAccount()) == 1){
			userMapper.updateRegisterUser(user);
			MailUtil.sendMail(user.getEmail(), "tickets验证码", "http://localhost:8080/tickets/user/confirmEmail?account=" + user.getAccount());
			return 1;
		}
		if(userMapper.getUserNumber(user.getAccount()) >= 1) {
			return -1;
		}
		if(userMapper.addUser(user) == 1) {
			MailUtil.sendMail(user.getEmail(), "tickets验证码", "http://localhost:8080/tickets/user/confirmEmail?account=" + user.getAccount());
			return 1;
		}
		return 0;
	}

	@Override
	public int confirmEmail(String account) {
		return userMapper.confirmEmail(account);
	}

	@Override
	public User login(User user) {
		return userMapper.login(user);
	}

	@Override
	public User getUserInfo(int id) {
		return userMapper.getUserInfo(id);
	}

	@Override
	public int modifyUser(User user) {
		return userMapper.modifyUser(user);
	}

	@Override
	public int dropUser(int id) {
		return userMapper.dropUser(id);
	}  
  
} 
