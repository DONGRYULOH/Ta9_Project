package com.example.demo.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.user.dao.UserDao;
import com.example.demo.user.dto.UserDto;
import com.example.demo.user.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/login")
	public String signIn() throws Exception {
		String result = userService.signIn();
		System.out.println("가져온 로그인 결과값은?"+result);
		return result;
	}
	
	@RequestMapping("/register")
	public String register() {
		return "register";
	}
	
}
