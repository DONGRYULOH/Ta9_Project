package com.example.demo.category.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.category.dao.CategoryDao;
import com.example.demo.category.dto.BlameDto;
import com.example.demo.category.dto.CvideoJoinVideoFileDto;
import com.example.demo.category.dto.VideoReplyDto;
import com.example.demo.mypage.dto.VideoJoinVideoFileDto;
import com.example.demo.utils.Pagination;

@Service
public class CategoryService {
	
	@Autowired
	private CategoryDao categoryDao;
	
	// 카테고리 코드 번호에 해당되는 모든 동영상 게시물 가져오기 
	public List<CvideoJoinVideoFileDto> getCategoryList(String cateCode,Pagination page) {
		try {
			Map<String,Object> list = new HashMap<>();
			list.put("cateCode", cateCode);
			list.put("perPageNum", page.getPerPageNum());
			list.put("pageStart", page.getPageStart());
			
			return categoryDao.getCategoryList(list);
		} catch (Exception e) {
			e.getStackTrace();
			System.err.println("카테고리 코드 번호에 해당되는 모든 동영상 게시물 가져오는중 에러발생 !!" + e.getMessage());
		}
		return null;
	}
	
	// 해당 게시물 신고 처리 
	public int reportInsert(BlameDto blameDto) {
		try {
			return categoryDao.reportInsert(blameDto);
		} catch (Exception e) {
			e.getStackTrace();
			System.err.println("해당 동영상 게시물 신고처리 중 에러발생!!" + e.getMessage());
		}
		return 0;
	}
	
	// 신고수 1증가 
	public void videoReportUpdate(int video_number) {
		try {
			categoryDao.videoReportUpdate(video_number);
		} catch (Exception e) {
			e.getStackTrace();
			System.err.println("해당 동영상 게시물 신고수 1증가 중 에러발생!!" + e.getMessage());
		}
	}
	
	// 해당 카테고리의 총 동영상 게시글 수 가져오기
	public int totalCount(String cateCode) {
		try {
			return categoryDao.totalCount(cateCode);
		} catch (Exception e) {
			e.getStackTrace();
			System.err.println("해당 카테고리의 총 동영상 게시글 수 가져오는 중 에러발생!!" + e.getMessage());
		}
		return 0;
	}

	// 댓글 작성 
	public int replyInsert(VideoReplyDto videoReplyDto) {
		int result = 0;
		try {
			result = categoryDao.replyInsert(videoReplyDto);
			result = categoryDao.replyUpdate_ref(videoReplyDto);
		} catch (Exception e) {
			e.getStackTrace();
			System.err.println("댓글 작성 중 에러발생!!" + e.getMessage());
		}
		return result;		
	}
	
	// 댓글 리스트 가져오기
	public List<VideoReplyDto> getReplyList(int video_number) {
		List<VideoReplyDto> replyList = null;
		try {
			 replyList = categoryDao.getReplyList(video_number);
		} catch (Exception e) {
			e.getStackTrace();
			System.err.println("댓글 리스트 가져오는 중 에러발생!!" + e.getMessage());
		}
		return replyList;
	}
	
	
}


























