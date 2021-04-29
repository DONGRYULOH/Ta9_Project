package com.example.demo.category.dto;

import java.util.Date;

import lombok.Data;

// 비디오 테이블과 비디오_파일 테이블 조인해서 데이터 가져오기 
@Data
public class CvideoJoinVideoFileDto {

	// 비디오 테이블 컬럼 
	private int video_number;
	private String user_id;
	private String category_code;
	private String video_title;
	private char public_check;
	private int video_reports;
	private Date video_insert_date;
	private int video_rank_limit;
	
	// 비디오_파일 테이블 
	private String orgin_video_name;
	private String stored_video_name;
	private String orgin_video_thumb;
	private String stored_video_thumb;
	
	// 댓글수
	private int reply_count;
}
