package com.example.demo.user.service;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.demo.SecurityConfig;
import com.example.demo.user.dao.UserDao;
import com.example.demo.user.dto.UserDto;
import com.example.demo.user.dto.VideoCartDto;

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
		int result = 0;
		try {
			// 패스워드 암호화후 회원가입 처리  
			userDto.setUser_pwd(securityConfig.getPasswordEncoder().encode(userDto.getUser_pwd()));
			result = userdao.register(userDto);
			
			// 회원가입후 유저상태 추가 
			// result = userdao.register_st(userDto);
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("회원가입 처리중 예외 발생 : "+ e.getMessage());			
		}
		
		return result;
	}
	
	// 로그인 처리 
	public HashMap<String,Integer> signIn(UserDto userDto,HttpSession session) {
		//입력한 패스워드와 db에 암호화해서 저장된 패스워드 일치여부(틀리면 False , 맞으면 true) 
		boolean pwdMatch = false;
		
		HashMap<String,Integer> resultSet = new HashMap<>();
		int result = -1; // result가 1이면 로그인 성공 -1이면 로그인 실패 
		int count = -1; // count가 0이면 처음 로그인인 경우 , count가 -1이면 처음 로그인이 아닌 경우 		
		
		try {
			// 1.DB에 해당 ID의 유저가 존재하는지 확인
			UserDto user = userdao.signIn(userDto);		
			if(user != null) {
				// 2.해당 ID의 유저가 존재한다면 입력한 패스워드와 DB에 암호화해서 저장되어있는 패스워드 비교
				pwdMatch = securityConfig.getPasswordEncoder().matches(userDto.getUser_pwd(),user.getUser_pwd());				
				// 3.입력한 패스워드가 일치하는 경우 로그인 성공 
				if(pwdMatch) {					
					result = 1;
					// 유저의 정보가 들어가있는 세션을 만듬 
					session.setAttribute("User",user);
					// 60*60 = 3600초(클라이언트가 1시간동안 요청이 없으면 세션을 제거함) 
					session.setMaxInactiveInterval(60*60);
					
					// 3-1.해당 날짜에 처음 로그인인지 아닌지 검사
					count = userdao.loginCheck(user.getUser_id());
					// 3-2.처음 로그인 시도일 경우 출석체크 테이블에 출석처리하고 100EXP 경험치 축적시키기 
					if(count == 0) {
						userdao.loginAttInsert(user.getUser_id()); // 출석체크 
						userdao.loginExpInsert(user.getUser_id()); // 경험치 추가
						// 경험치가 Update 되면 해당 유저의 등급 상승 여부 확인후 업데이트 하는 스토어드 프로시저 호출
						userdao.rankUpdateCkProcedures(user.getUser_id()); 
						
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("로그인 처리중 예외 발생 : "+ e.getMessage());
		}finally {
			resultSet.put("loginCk",result); // 로그인 성공여부에 따라 이동될 주소
			resultSet.put("loginAttCk",count); // 처음 로그인 시도일 경우인지 아닌지 체크 
		}		 				
		
		return resultSet;
	}

	// 해당 유저가 해당 동영상 게시물을 자신의 위시리스트 목록에 추가했는지 체크
	public int videoCartCk(VideoCartDto videoCartDto) {
		try {
			return userdao.videoCartCk(videoCartDto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("해당 동영상 게시물을 자신의 위시리스트 목록에 추가했는지 체크 중 에러발생! : "+ e.getMessage());			
		}
		return 1;
	}
	
	// 해당 유저의 위시리스트 목록에 동영상 추가하기 
	public void addVideoCart(VideoCartDto videoCartDto) {
		try {
			userdao.addVideoCart(videoCartDto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("위시리스트 목록에 동영상 추가하기 중 에러발생! : "+ e.getMessage());			
		}		
	}
}























