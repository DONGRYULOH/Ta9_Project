package com.example.demo.user.dao;

import org.springframework.context.annotation.Configuration;

import com.example.demo.user.dto.UserDto;
import com.example.demo.user.dto.VideoCartDto;


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

	// 경험치가 Update 되면 해당 유저의 등급 상승 여부 확인후 업데이트 하는 스토어드 프로시저 호출
	public void rankUpdateCkProcedures(String user_id);
	
	// 해당 유저가 해당 동영상 게시물을 자신의 위시리스트 목록에 추가했는지 체크
	public int videoCartCk(VideoCartDto videoCartDto) throws Exception;
	
	// 해당 유저의 위시리스트 목록에 동영상 추가하기 
	public void addVideoCart(VideoCartDto videoCartDto) throws Exception;
	
	// 패스워드 변경 
	public int pwd_update(UserDto userDto) throws Exception;
}













