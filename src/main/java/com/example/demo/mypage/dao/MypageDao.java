package com.example.demo.mypage.dao;

import java.util.List;
import java.util.Map;

import com.example.demo.mypage.dto.VideoDto;
import com.example.demo.mypage.dto.VideoJoinVideoFileDto;

public interface MypageDao {
	
	// 파일(비디오,썸네일 이미지)을 제외한 게시글 정보 Insert 
	int videoBoardInsert(VideoDto videoDto) throws Exception;

	// 파일(비디오,썸네일 이미지) 정보 Insert 
	int videoFileInsert(Map<String, Object> files) throws Exception;

	// 해당 유저에 해당하는 동영상 게시물 리스트 가져오기 
	List<VideoJoinVideoFileDto> getVideoList(String user_id) throws Exception;

}
