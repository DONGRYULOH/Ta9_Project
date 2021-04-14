package com.example.demo.mypage.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	public String mypage_create(VideoDto videoDto,HttpServletRequest request) {
		System.out.println("제목:"+videoDto.getVideo_title());
		System.out.println("카테고리 코드:"+videoDto.getCategory_code());
		System.out.println("공개여부:"+videoDto.getPublic_check());
		System.out.println("제한 등급:"+videoDto.getVideo_rank_limit());
				

		
		
		
		//HttpServletRequest 이용해 전송된(업로드한) 파일들(썸네일,동영상)을 가져온다 
		MultipartHttpServletRequest MultipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = MultipartHttpServletRequest.getFileNames();		
		MultipartFile multipartFile = null;
		
		while(iterator.hasNext()) {
			multipartFile = MultipartHttpServletRequest.getFile(iterator.next());

			System.out.println("파일 이름 : " + multipartFile.getOriginalFilename());
			System.out.println("파일 크기 : " + multipartFile.getSize());
		}
		
		
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
