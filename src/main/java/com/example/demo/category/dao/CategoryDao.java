package com.example.demo.category.dao;

import java.util.List;
import java.util.Map;

import com.example.demo.category.dto.BlameDto;
import com.example.demo.category.dto.CvideoJoinVideoFileDto;
import com.example.demo.category.dto.VideoReplyDto;
import com.example.demo.mypage.dto.VideoJoinVideoFileDto;

public interface CategoryDao {

	// 카테고리 코드 번호에 해당되는 모든 동영상 게시물 가져오기 
	List<CvideoJoinVideoFileDto> getCategoryList(Map<String,Object> list) throws Exception;

	// 해당 동영상 게시물 신고처리 
	int reportInsert(BlameDto blameDto) throws Exception;
	
	// 신고수 1 증가 
	void videoReportUpdate(int video_number) throws Exception;

	// 해당 카테고리의 총 동영상 게시글 수 가져오기
	int totalCount(String cateCode) throws Exception;

	// 댓글 작성 
	int replyInsert(VideoReplyDto videoReplyDto) throws Exception;
	
	// 댓글 작성후 ref 값 변경 
	int replyUpdate_ref(VideoReplyDto videoReplyDto) throws Exception;

	// 댓글 리스트 
	List<VideoReplyDto> getReplyList(int video_number) throws Exception;

	// 댓글 수정 
	int replyUpdate(VideoReplyDto videoReplyDto) throws Exception;

	// 댓글 삭제 
	int replyDelete(VideoReplyDto videoReplyDto) throws Exception;
	
	// 댓글 많은순 정렬해서 가져오기 
	List<CvideoJoinVideoFileDto> getCategoryRList(Map<String, Object> list) throws Exception;

	// 검색 
	List<CvideoJoinVideoFileDto> getCategorySearchList(Map<String, Object> searchList) throws Exception;

	// 오늘 등록된 전체 동영상 게시물 개수  
	//Integer getAllCateCnt() throws Exception;
	
	// 오늘 등록된 카테고리별 동영상 게시물 수 
	//Integer getCateCnt(String category_code) throws Exception;
	
	
		

}
