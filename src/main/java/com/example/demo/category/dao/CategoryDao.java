package com.example.demo.category.dao;

import java.util.List;

import com.example.demo.category.dto.BlameDto;
import com.example.demo.category.dto.CvideoJoinVideoFileDto;
import com.example.demo.mypage.dto.VideoJoinVideoFileDto;

public interface CategoryDao {

	// 카테고리 코드 번호에 해당되는 모든 동영상 게시물 가져오기 
	List<CvideoJoinVideoFileDto> getCategoryList(String cateCode) throws Exception;

	// 해당 동영상 게시물 신고처리 
	int reportInsert(BlameDto blameDto) throws Exception;

}
