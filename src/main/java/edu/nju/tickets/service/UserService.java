package edu.nju.tickets.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

import edu.nju.tickets.pojo.User;

public interface UserService {  
	
	public int register(User user) throws UnsupportedEncodingException, MessagingException;
	
	public int confirmEmail(String account);
	
	public User login(User user);

	public User getUserInfo(int id);

	public int modifyUser(User user);

	public int dropUser(int id);
	
}  