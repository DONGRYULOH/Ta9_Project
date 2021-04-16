package com.example.demo.user.dao;

import org.springframework.context.annotation.Configuration;

import com.example.demo.user.dto.UserDto;


public interface UserDao {

	// 로그인 처리 
    public UserDto signIn(UserDto userDto) throws Exception;

    // ID 중복체크 검사	
	public int idCheck(String user_id) throws Exception;

	// 닉네임 중복체크 검사
	public int nicknameCheck(String user_nickname) throws Exception;

	// 회원가입 처리 
	public int register(UserDto userDto) throws Exception;
	
	// 회원가입후 유저상태 추가 
	public int register_st(UserDto userDto) throws Exception;
}
