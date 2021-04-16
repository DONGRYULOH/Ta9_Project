package com.example.demo.category.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.user.dao.UserDao;
import com.example.demo.user.dto.UserDto;
import com.example.demo.user.service.UserService;

@Controller
public class SportsController {
	
	
	@RequestMapping("/sports")
	public String sports(HttpSession session,Model model) {
		
		model.addAttribute("User", session.getAttribute("User"));
		return "sports";
	}
	
	@RequestMapping("/sportsDetail")
	public String sportsDetail() {
		return "sportsDetail";
	}
	
}
