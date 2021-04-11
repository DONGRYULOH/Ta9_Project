package com.example.demo.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.user.dao.UserDao;
import com.example.demo.user.dto.UserDto;
import com.example.demo.user.service.UserService;

@Controller
public class MypageController {
	
	
	@RequestMapping("/mypage")
	public String mypage() {
		return "myPage/mypage_index";
	}
	
	@RequestMapping("/mypage_video_manage")
	public String mypage_video_manage() {
		return "myPage/mypage_video_manage";
	}
	
	@RequestMapping("/mypage_info")
	public String mypage_info() {
		return "myPage/mypage_info";
	}
	
}
