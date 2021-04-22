package com.example.demo.category.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.category.dao.CategoryDao;
import com.example.demo.category.dto.BlameDto;
import com.example.demo.category.dto.CvideoJoinVideoFileDto;
import com.example.demo.mypage.dto.VideoJoinVideoFileDto;

@Service
public class CategoryService {
	
	@Autowired
	private CategoryDao categoryDao;
	
	// 카테고리 코드 번호에 해당되는 모든 동영상 게시물 가져오기 
	public List<CvideoJoinVideoFileDto> getCategoryList(String cateCode) {
		try {
			return categoryDao.getCategoryList(cateCode);
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
}
