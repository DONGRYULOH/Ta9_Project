package com.example.demo.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.mypage.dto.VideoDto;
import com.example.demo.user.dao.UserDao;
import com.example.demo.user.dto.UserDto;
import com.example.demo.user.service.UserService;

@Controller
public class MypageController {
	
	
	@RequestMapping(value = "/mypage",method = RequestMethod.GET)
	public String mypage() {
		return "myPage/mypage_index";
	}
	
	// 동영상 업로드하기 
	@RequestMapping(value = "/mypage_create",method = RequestMethod.POST)
	public String mypage_create(VideoDto videoDto) {
		System.out.println("제목:"+videoDto.getVideo_title());
		System.out.println("카테고리 코드:"+videoDto.getCategory_code());
		System.out.println("공개여부:"+videoDto.getPublic_check());
		System.out.println("포인트:"+videoDto.getVideo_price());
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
