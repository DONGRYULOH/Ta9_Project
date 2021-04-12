package com.example.demo.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.demo.SecurityConfig;
import com.example.demo.user.dao.UserDao;
import com.example.demo.user.dto.UserDto;

@Service
public class UserService {

	@Autowired
	private UserDao userdao;
	
	// 패스워드 암호화 의존성 주입 (PasswordEncoder 인터페이스는 Bean으로 등록되어 있지 않기 떄문에 따로 Bean으로 등록을 해야됨!) 
	@Autowired
	private SecurityConfig securityConfig; 

	// ID 중복체크 검사 
	public int idCheck(String user_id) {
		try {
			return userdao.idCheck(user_id);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ID 중복체크 검사중 예외 발생 : "+ e.getMessage());
			return 1;
		}		
	}

	// 닉네임 중복체크 검사 
	public int nicknameCheck(String user_nickname) {
		try {
			return userdao.nicknameCheck(user_nickname);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("닉네임 중복체크 검사중 예외 발생 : "+ e.getMessage());
			return 1;
		}		
	}
	
	// 회원가입 처리 
	public int register(UserDto userDto) {
		try {
			// 패스워드 암호화 
			userDto.setUser_pwd(securityConfig.getPasswordEncoder().encode(userDto.getUser_pwd()));
			return userdao.register(userDto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("회원가입 처리중 예외 발생 : "+ e.getMessage());
			return 0;
		}
		
	}
	
	// 로그인 처리 
	public int signIn(UserDto userDto) {
		//입력한 패스워드와 db에 암호화해서 저장된 패스워드 일치여부(틀리면 False , 맞으면 true) 
		boolean pwdMatch = false;
		// 로그인 성공여부에 따라 이동될 주소 
		int result = -1;
		try {
			// 1.DB에 해당 ID의 유저가 존재하는지 확인
			UserDto user = userdao.signIn(userDto);
			if(user != null) {
				// 2.해당 ID의 유저가 존재한다면 입력한 패스워드와 DB에 암호화해서 저장되어있는 패스워드 비교
				pwdMatch = securityConfig.getPasswordEncoder().matches(userDto.getUser_pwd(),user.getUser_pwd());				
				// 3.입력한 패스워드가 일치하는 경우 로그인 성공 
				if(pwdMatch) result = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("로그인 처리중 예외 발생 : "+ e.getMessage());
		}		 		
		 
		return result;
	}
}























