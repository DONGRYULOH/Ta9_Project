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
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	public String mypage_create(VideoDto videoDto,HttpServletRequest request) {
		
		//클라이언트에서 전송된 파일정보를 담아서 Mybatis Mapper에서 뿌려줄 정보(썸네일 파일,비디오 파일) 
		Map<String,Object> Files = new HashMap<String,Object>(); 		
		
		// 1.파일(동영상,썸네일) 업로드하기 
		fileUtils.parseInsertFileInfo(Files, request);					
						
		// 2.동영상 게시글 + 파일 DB에 INSERT 
		int result = mypageService.videoUpload(videoDto,Files);
	
		if(result == 1) System.out.println("INSERT 성공 해당 동영상 게시글로 이동");
		else System.out.println("INSERT 실패 또는 INSERT 도중 에러 발생 영상 올리기 페이지로 이동");
		
		return "myPage/mypage_index";
	}
	
	// 동영상 게시물 리스트 페이지 이동 
	@RequestMapping(value = "/mypage_videoList",method = RequestMethod.GET)
	public String mypage_video_manage(HttpSession session,Model model) {
		
		UserDto user = (UserDto)session.getAttribute("User");
		List<VideoJoinVideoFileDto> videoBrdList = null;
		
		if(user != null) {
			videoBrdList = mypageService.getVideoList(user.getUser_id());
		}
		
		for(int i=0;i<videoBrdList.size();i++) {
			System.err.println("동영상 게시글 제목 : " + videoBrdList.get(i).getVideo_title());
		}
		
		model.addAttribute("videoBrdList",videoBrdList);
		model.addAttribute("videoBrdListSize",videoBrdList.size());
		
		return "myPage/mypage_videoList";
	}
	
	@RequestMapping("/mypage_info")
	public String mypage_info() {
		return "myPage/mypage_info";
	}
	
}
























