package com.example.demo.mypage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mypage.dao.MypageDao;
import com.example.demo.mypage.dto.VideoDto;
import com.example.demo.mypage.dto.VideoJoinVideoFileDto;

@Service
public class MypageService {

	@Autowired
	private MypageDao mypageDao;

	// 동영상 게시물 업로드 (트랜잭션 걸어주기)  
	public int videoUpload(VideoDto videoDto, Map<String, Object> files) {
		
		int result = 0; // 동영상 게시글 DB에 Insert한 결과(1 -> 정상적으로 수행완료 , 0 -> 에러발생) 
		
		// 전체공개일 경우는 랭크제한이 없도록 설정을 해줌 
		if(videoDto.getPublic_check() == 'Y') { 
			videoDto.setVideo_rank_limit("no_rank");
		}
		
		try {
			// 1.파일(비디오,썸네일 이미지)을 제외한 게시글 정보 Insert 
			result = mypageDao.videoBoardInsert(videoDto); // 수행 결과(1-정상 , 0-에러발생)			
			files.put("video_number",videoDto.getVideo_number());
		
			// 2.파일(비디오,썸네일 이미지) 정보 Insert 
			result = mypageDao.videoFileInsert(files); // 수행 결과(1-정상 , 0-에러발생) 
		}catch (Exception e) {
			e.getStackTrace();
			System.out.println("동영상 게시글 INSERT 중 에러발생 !!" + e.getMessage());			
		}
		
		return result;
	}
	
	// 해당 유저에 해당하는 동영상 게시물 리스트 가져오기 
	public List<VideoJoinVideoFileDto> getVideoList(String user_id) {
		try {
			return mypageDao.getVideoList(user_id);
		} catch (Exception e) {
			e.getStackTrace();
			System.out.println("해당 유저에 해당하는 동영상 게시물 리스트 가져오는중 에러발생 !!" + e.getMessage());
		}
		return null;
	}
	
	
}
