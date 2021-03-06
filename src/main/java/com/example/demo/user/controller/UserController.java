package com.example.demo.user.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.api.NaverSearch;
import com.example.demo.api.NewsCategory;
import com.example.demo.user.dao.UserDao;
import com.example.demo.user.dto.UserDto;
import com.example.demo.user.dto.VideoCartDto;
import com.example.demo.user.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Resource(name="NaverSearch")
	private NaverSearch naverSearch;
	
	//ID 중복체크 검사 
	@RequestMapping(value = "/idCheck",method = RequestMethod.POST)
	@ResponseBody
	public int idCheck(@RequestBody(required = false) String user_id) {
		
		int count = 0;
		if(user_id != null) {
			count = userService.idCheck(user_id);
		}
		
		return count; 
	}
	
	//닉네임 중복체크 검사 
	@RequestMapping(value = "/nicknameCheck",method = RequestMethod.POST)
	@ResponseBody
	public int nicknameCheck(@RequestBody(required = false) String user_nickname) {
		
		int count = 0;
		if(user_nickname != null) {
			count = userService.nicknameCheck(user_nickname);
		}
		
		return count; 
	}
	
	// 회원가입 페이지 이동 
	@RequestMapping(value="/register" , method = RequestMethod.GET)
	public String register() {
		return "user/register";
	}
	
	// 회원가입 처리 
	@RequestMapping(value="/register" , method = RequestMethod.POST)
	public String register(UserDto userDto,Model model,RedirectAttributes rd) {
		 
		String url = "user/register";
		int result = userService.register(userDto);
		
		if(result == 1) {			
			url = "redirect:/login";
		}
		else {
			result = -1;
			model.addAttribute("register_msg","회원가입 실패 다시 회원가입 시도 바람!");
			model.addAttribute("register_result",result);
		}			
		
		return url;
	}

	// 로그인 페이지 이동 
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String signIn(RedirectAttributes rd) {
		return "user/login";
	}
	
	// 로그인 처리
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String signIn(UserDto userDto,Model model,HttpSession session) {
		// 로그인 성공여부에 따라 이동될 주소 ( -1 : 로그인 실패 , 1 : 로그인 성공)
		String url = "user/login";
		
		// <로그인 성공시 세션 부여하기 + 뉴스기사리스트 가져오기> 
		HashMap<String,Integer> resultSet = userService.signIn(userDto,session);		
		if(resultSet.get("loginCk") == 1) { // 로그인 성공시 index 페이지로 이동 
			url = "index";
			if(resultSet.get("loginAttCk") == 0) { // 처음 로그인시 100EXP 지급 했다고 메시지 띄우기
				model.addAttribute("result2",resultSet.get("loginAttCk"));
				model.addAttribute("msg2","오늘 최초 로그인이시네요~ 100EXP 지급완료!");
			}	
			NewsCategory newsCategory = new NewsCategory();
			List<Map<String,Object>> newsList = new ArrayList<Map<String,Object>>();
			
			for(int i=0;i<newsCategory.getNewsList().size();i++) {
				newsList.add(naverSearch.Search(newsCategory.getNewsList().get(i)));
			}
				
			model.addAttribute("allList",newsList);
			model.addAttribute("allListSize",newsList.size());
		}  
								
		model.addAttribute("login_msg","로그인 실패! 다시 시도 바람!");
		model.addAttribute("login_result",resultSet.get("loginCk"));			
		
		return url;
	}
	
	// 로그아웃 처리시 
	@RequestMapping(value="/signOut", method = RequestMethod.GET)
	public String signOut(HttpSession session) {
		session.invalidate(); // 세션 날리기 
		return "redirect:/";
	}
	
	// 해당 유저의 위시리스트 목록에 추가 
	@RequestMapping(value="/addVideoCart", method = RequestMethod.GET)
	@ResponseBody
	public int addVideoCart(@RequestParam("video_number") int video_number,HttpSession session) {
		
		UserDto user = (UserDto)session.getAttribute("User");
		VideoCartDto videoCartDto = new VideoCartDto();
		videoCartDto.setUser_id(user.getUser_id());
		videoCartDto.setVideo_number(video_number); 
		
		// 1.해당 유저가 해당 동영상 게시물을 자신의 위시리스트 목록에 추가했는지 체크
		int result = userService.videoCartCk(videoCartDto);
		
		// 2.위시리스트 목록에 추가가 안되어있다면 추가를 해줌 
		if(result == 0) userService.addVideoCart(videoCartDto);
				
		return result;
	}
	
	// 패스워드 변경 처리 
	@RequestMapping(value="/pwd_update", method = RequestMethod.POST)
	public String pwd_update(UserDto userDto,Model model,HttpSession session) {
		
		// 패스워드 변경 
		userService.pwd_update(userDto,session);
		
		session.invalidate(); // 세션 날리기 
		return "redirect:/";
	}
	
}


/*
 <POST 방식에서 데이터를 전달해서 사용하는 방식>
 
 @RequestBody 란? 
 : 클라이언트가 전송하는 HTTP 요청안의 Body의 내용을 Java Object로 변환시켜주는 역할을 함 
 (Body가 존재하지 않는 GET 방식의 메서드에서는 사용하기에 적합하지 않음 왜냐하면 GET 메서드 요청의 경우에는
 URL 파라미터로 데이터가 전달되기 때문)
 즉,POST 방식 JSON 형태로 넘어온 데이터들을 Java Object로 변환시켜주는 역할 수행 
 
 @ResponseBody 란?
 : HTTP의 Body 안에 자바객체의 데이터를 넣어서 응답함 (기본적으로 request시의 데이터 타입으로 반환) 
 
  @RequestBody(required = false) -> 요구되는 값이 없어도 상관없음
  @RequestBody(required = true) -> 요구되는 값이 있어야됨(디폴트)   
*/