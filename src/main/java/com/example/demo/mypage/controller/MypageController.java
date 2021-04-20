package com.example.demo.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.mypage.dto.VideoDto;
import com.example.demo.mypage.dto.VideoJoinVideoFileDto;
import com.example.demo.mypage.service.MypageService;
import com.example.demo.user.dao.UserDao;
import com.example.demo.user.dto.UserDto;
import com.example.demo.user.service.UserService;
import com.example.demo.utils.FileUtils;

@Controller
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	@Resource(name="FileUtils")
	private FileUtils fileUtils;
	
	@RequestMapping(value = "/mypage",method = RequestMethod.GET)
	public String mypage() {
		return "myPage/mypage_index";
	}
	
	// 동영상 게시물 업로드하기 
	@RequestMapping(value = "/mypage_create",method = RequestMethod.POST)
	public String mypage_create(VideoDto videoDto,HttpServletRequest request,HttpSession session,RedirectAttributes redirectAttributes) {
		
		//클라이언트에서 전송된 파일정보를 담아서 Mybatis Mapper에서 뿌려줄 정보(썸네일 파일,비디오 파일) 
		Map<String,Object> Files = new HashMap<String,Object>(); 				
		
		// 1.파일(동영상,썸네일) 업로드하기 
		fileUtils.parseInsertFileInfo(Files, request);					
						
		// 2.동영상 게시글 + 파일 DB에 INSERT 
		int result = mypageService.videoUpload(videoDto,Files,session);
		
		// 3.동영상 게시글 INSERT 후 해당 동영상 게시글 상세 페이지로 이동하기 위한 번호를 얻어옴 
		String url = "redirect:mypage_create";
		if(result == 1) {
			url = mypageService.videoDetailNumber(redirectAttributes,url);
		}
		else System.err.println("INSERT 실패 또는 INSERT 도중 에러 발생 영상 올리기 페이지로 이동");
		
		return url;
	}
	
	// 동영상 게시물 리스트 페이지 이동 
	@RequestMapping(value = "/mypage_videoList",method = RequestMethod.GET)
	public String mypage_videoList(HttpSession session,Model model) {
		
		UserDto user = (UserDto)session.getAttribute("User");
		List<VideoJoinVideoFileDto> videoBrdList = null;
		
		if(user != null) videoBrdList = mypageService.getVideoList(user.getUser_id());

		if(videoBrdList != null) {
			model.addAttribute("videoBrdList",videoBrdList);
			model.addAttribute("videoBrdListSize",videoBrdList.size());
		}
		
		return "myPage/mypage_videoList";
	}
	
	// 동영상 게시물 상세 페이지 이동
	@RequestMapping(value = "/mypage_videoDetail",method = RequestMethod.GET)
	public String mypage_videoDetail(@RequestParam("n") int video_number, Model model) {
		
		// 동영상 게시물 번호에 해당하는 정보 가져오기 
		VideoJoinVideoFileDto videoDetail = mypageService.getVideoDetail(video_number);
		model.addAttribute("videoDetail",videoDetail);
		
		return "myPage/mypage_videoDetail";
	}
	
	
	
	// 내정보 페이지 이동 
	@RequestMapping("/mypage_info")
	public String mypage_info(HttpSession session,Model model) {
		
		// 현재 세션에 저장되어 있는 유저 정보  
		UserDto user = (UserDto)session.getAttribute("User");
		if(user != null) user = mypageService.getUserInfo(user.getUser_id());
		
		model.addAttribute("User",user);
		
		return "myPage/mypage_info";
	}
	
}
























