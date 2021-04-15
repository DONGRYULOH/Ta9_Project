package com.example.demo.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.user.dao.UserDao;
import com.example.demo.user.dto.UserDto;
import com.example.demo.user.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
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
	public String register(UserDto userDto,Model model) {
		String msg = null; 
		int result = userService.register(userDto);
		if(result == 1) {
			msg = "회원가입 성공!";
		}
		else {
			result = -1;
			msg = "회원가입 실패 다시 회원가입 시도 바람!";
		}		
		model.addAttribute("msg",msg);
		model.addAttribute("result",result);
		return "user/register";
	}

	// 로그인 페이지 이동 
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String signIn() {
		return "user/login";
	}
	
	// 로그인 처리
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String signIn(UserDto userDto,Model model,HttpSession session) {
		// 로그인 성공여부에 따라 이동될 주소 ( -1 : 로그인 실패 , 1 : 로그인 성공)
		String url = "user/login";
		// 로그인시 출력될 메시지 
		String msg = "로그인 실패! 다시 시도 바람!"; 
		
		int result = userService.signIn(userDto);
		// 로그인 성공시 세션 부여 
		if(result == 1) {
			session.setAttribute("User",userDto);	
			url = "index";
			msg = "로그인 성공!";
		}
		
		//System.out.println("현재 세션값 : " + session.getAttribute("User"));			
		//UserDto user = (UserDto)session.getAttribute("User");
		//System.out.println("현재 세션에 있는 ID: " + user.getUser_id());
		
		model.addAttribute("msg",msg);
		model.addAttribute("result",result);			
		
		return url;
	}
	
	// 로그아웃 처리시 
	@RequestMapping(value="/signOut", method = RequestMethod.GET)
	public String signOut(HttpSession session) {
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