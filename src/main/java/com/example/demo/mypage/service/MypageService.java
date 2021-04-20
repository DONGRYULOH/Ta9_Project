package com.example.demo.mypage.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.mypage.dao.MypageDao;
import com.example.demo.mypage.dto.VideoDto;
import com.example.demo.mypage.dto.VideoJoinVideoFileDto;
import com.example.demo.user.dto.UserDto;

@Service
public class MypageService {

	@Autowired
	private MypageDao mypageDao;

	// 동영상 게시물 업로드 (트랜잭션 걸어주기)  
	public int videoUpload(VideoDto videoDto, Map<String, Object> files,HttpSession session) {
		
		// 현재 세션에 있는 유저정보를 가져옴 
		UserDto user = (UserDto)session.getAttribute("User");
		videoDto.setUser_id(user.getUser_id());
		// 동영상 게시글 DB에 Insert한 결과(1 -> 정상적으로 수행완료 , 0 -> 에러발생) 
		int result = 0; 
		
		// 전체공개일 경우는 랭크제한이 없도록 설정을 해줌 
		if(videoDto.getPublic_check() == 'Y') { 
			videoDto.setVideo_rank_limit(0);
		}
		
		try {
			// 1.경험치 적립 여부 체크(해당 유저가 오늘날짜에 동영상 게시물을 업로드 헀는지 안했는지 검사)
			int count = mypageDao.videoUploadCk(user.getUser_id());
			if(count == 0) { // 경험치 적립 가능(0이면 해당 날짜에 업로드한 동영상 게시물이 없다는 뜻)  				
				
				// 1-1.해당 유저의 경험치를 Update 시켜줌 
				int exp_result = mypageDao.ExpUpdate(user.getUser_id());
				System.out.println("경험치 업데이트 결과값 :" + exp_result);
				
				// 1-2.경험치가 정상적으로 Update 되면 해당 유저의 등급 상승 여부 확인후 업데이트 하는 스토어드 프로시저 호출
				if(exp_result == 1) {
					mypageDao.rankUpdateCkProcedures(user.getUser_id()); 
				}
				
			}else {
				System.out.println("이미 적립 됨");
			}
			
			// 2.파일(비디오,썸네일 이미지)을 제외한 게시글 정보 Insert 
			result = mypageDao.videoBoardInsert(videoDto); // 수행 결과(1-정상 , 0-에러발생)			
			files.put("video_number",videoDto.getVideo_number());
		
			// 3.파일(비디오,썸네일 이미지) 정보 Insert 
			result = mypageDao.videoFileInsert(files); // 수행 결과(1-정상 , 0-에러발생) 					
			
		}catch (Exception e) {
			e.getStackTrace();
			System.err.println("동영상 게시글 INSERT 중 에러발생 !!" + e.getMessage());			
		}
		
		return result;
	}
	
	// 해당 유저에 해당하는 동영상 게시물 리스트 가져오기 
	public List<VideoJoinVideoFileDto> getVideoList(String user_id) {
		try {
			return mypageDao.getVideoList(user_id);
		} catch (Exception e) {
			e.getStackTrace();
			System.err.println("해당 유저에 해당하는 동영상 게시물 리스트 가져오는중 에러발생 !!" + e.getMessage());
		}
		return null;
	}
	
	// 동영상 게시물 번호에 해당하는 정보 가져오기 
	public VideoJoinVideoFileDto getVideoDetail(int video_number) {
		try {
			return mypageDao.getVideoDetail(video_number);
		} catch (Exception e) {
			e.getStackTrace();
			System.err.println("해당 동영상 게시물 번호에 해당하는 정보 가져오는중 에러발생!!" + e.getMessage());
		}
		return null;
	}
	
	// 동영상 게시글 INSERT 후 해당 동영상 게시글 상세 페이지로 이동하기 위한 번호를 얻어옴  	
	public String videoDetailNumber(RedirectAttributes redirectAttributes,String url) {
		try {
			int seq = mypageDao.videoDetailNumber();
			if(seq != ' ') {
				url = "redirect:mypage_videoDetail";
				redirectAttributes.addAttribute("n",seq);
			}
		} catch (Exception e) {
			e.getStackTrace();
			System.err.println("해당 동영상 게시물 번호 가져오는 중 에러발생" + e.getMessage());
		} 
		return url;
	}
	
	// 유저 정보 가져오기 
	public UserDto getUserInfo(String user_id) {
		try {
			return mypageDao.getUserInfo(user_id);
		} catch (Exception e) {
			e.getStackTrace();
			System.err.println("해당 유저 정보 가져오는 중 에러발생!!" + e.getMessage());
		}
		return null;
	}

	


	
	
}
