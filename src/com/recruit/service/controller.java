package com.recruit.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.recruit.mapper.UserMapper;
import com.recruit.model.User;

@Controller
@RequestMapping
public class controller {
	
	@Resource 
	public UserMapper mapper;
	@RequestMapping("login1")//http://localhost:8080/recruit/login
	public String Login1(ModelMap map,User user){
		return "login";
	}

	//@RequestMapping("login")//http://localhost:8080/recruit/login
	public String Login(ModelMap map,User user){

		return "success";//WEB-INF/login.jsp
	}
}
