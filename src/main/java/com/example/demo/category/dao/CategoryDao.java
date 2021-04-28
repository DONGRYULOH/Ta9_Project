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

	List<VideoReplyDto> getReplyList(int video_number) throws Exception;

}
