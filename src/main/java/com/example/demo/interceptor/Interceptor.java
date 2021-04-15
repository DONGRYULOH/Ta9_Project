package com.example.demo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.example.demo.user.dto.UserDto;

@Component
public class Interceptor implements HandlerInterceptor{
	
	// 클라이언트의 요청을 컨트롤러에 전달하기 전에 호출된다.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception {
		  HttpSession session = request.getSession();
		  UserDto user = (UserDto)session.getAttribute("User");		 
		  
		  //세션이 없을때(로그인이 되어있지 않은상태라면) 
		  if(user == null ) {
			  System.out.println("로그인 화면으로 강제이동");
			  response.sendRedirect("/");
			  return false;
		  }
		  
		  return true;
	}

}
