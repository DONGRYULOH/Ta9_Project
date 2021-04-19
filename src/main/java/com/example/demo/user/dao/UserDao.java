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

	// 해당 날짜에 처음 로그인인지 아닌지 검사
	public int loginCheck(String user_id);

	// 처음 로그인 시도일 경우 출석체크 테이블에 출석처리하기 
	public void loginAttInsert(String user_id);

	// 처음 로그인 시도일 경우 해당 유저의 경험치 추가하기  
	public void loginExpInsert(String user_id);
}
