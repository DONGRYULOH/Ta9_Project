package com.example.demo.mypage.dao;

import java.util.List;
import java.util.Map;

import com.example.demo.mypage.dto.VideoCart_FileDto;
import com.example.demo.mypage.dto.VideoDto;
import com.example.demo.mypage.dto.VideoJoinVideoFileDto;
import com.example.demo.user.dto.UserDto;

public interface MypageDao {
	
	// 파일(비디오,썸네일 이미지)을 제외한 게시글 정보 Insert 
	int videoBoardInsert(VideoDto videoDto) throws Exception;

	// 파일(비디오,썸네일 이미지) 정보 Insert 
	int videoFileInsert(Map<String, Object> files) throws Exception;

	// 해당 유저에 해당하는 동영상 게시물 리스트 가져오기(최신순)
	List<VideoJoinVideoFileDto> getVideoList(Map<String,Object> userVideoList) throws Exception;
	
	// 해당 유저에 해당하는 동영상 게시물 리스트 가져오기(댓글많은순)
	List<VideoJoinVideoFileDto> getVideoRList(Map<String, Object> userVideoList) throws Exception;

	// 포인트 지급 여부 체크(해당 유저가 오늘날짜에 동영상 게시물을 업로드 헀는지 안했는지 검사)
	int videoUploadCk(String user_id) throws Exception;

	// 해당 유저의 경험치를 300 EXP Update 시켜줌
	int ExpUpdate(String user_id) throws Exception;

	// 해당 유저의 등급 상승 여부 확인후 업데이트 하는 스토어드 프로시저 호출
	void rankUpdateCkProcedures(String user_id) throws Exception;

	// 유저 정보 가져오기
	UserDto getUserInfo(String user_id) throws Exception;

	// 동영상 게시물 번호에 해당하는 정보 가져오기 
	VideoJoinVideoFileDto getVideoDetail(int video_number) throws Exception;
	
	// 동영상 게시글 INSERT 후 해당 동영상 게시글 상세 페이지로 이동하기 위한 번호를 얻어옴 
	int videoDetailNumber() throws Exception;
	
	// 해당 동영상 게시물 삭제하기 
	int deleteVideo(int video_number) throws Exception;
	
	// 현재 유저가 삭제하고자 하는 썸네일명을 DB에서 꺼내옴
	String getThumbFileName(int video_number) throws Exception;
	
	// 해당 동영상 게시물 업데이트(파일 제외)
	int videoBrdUpdate(VideoDto videoDto) throws Exception;

	// 해당 동영상 썸네일 업데이트 
	int videoThumbUpdate(Map<String, Object> thumbFile) throws Exception;

	// 현재 세션에 저장되어 있는 유저에 대한 위시리스트 목록 가져오기(최신순)
	List<VideoCart_FileDto> mypage_cartList(Map<String,Object> userVideoList) throws Exception;
	
	// 현재 세션에 저장되어 있는 유저에 대한 위시리스트 목록 가져오기(댓글많은순)
	List<VideoCart_FileDto> mypage_cartRList(Map<String, Object> userVideoList) throws Exception;
	
	// 동영상 게시물 위시리스트 페이지에서 해당 게시물 제거
	void mypage_cartDelete(int video_cart_number) throws Exception;
	
	// 해당 유저의 총 동영상 게시물 수
	int userTotalCount(String user_id) throws Exception;

	// 해당 유저가 위시리스트에 담은 총 동영상 게시물 수 
	int userCartTotalCount(String user_id) throws Exception;

	

}





























