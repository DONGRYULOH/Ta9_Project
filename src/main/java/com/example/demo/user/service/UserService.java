package com.example.demo.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.user.dao.UserDao;
import com.example.demo.user.dto.UserDto;

@Service
public class UserService {

	@Autowired
	private UserDao userdao;
	


	public String signIn() throws Exception {
		return userdao.signIn();
	}

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
			return userdao.register(userDto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("회원가입 처리중 예외 발생 : "+ e.getMessage());
			return 0;
		}
		
	}
}
