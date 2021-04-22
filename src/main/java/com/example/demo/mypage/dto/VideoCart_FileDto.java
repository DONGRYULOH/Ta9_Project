package com.example.demo.mypage.dto;

import java.util.Date;

import lombok.Data;

@Data
public class VideoCart_FileDto {
	
	private int video_cart_number;
	private String user_id;
	private int video_number;
	
	private String category_code;
	private String video_title;
	private char public_check;
	private int video_hits;
	private int video_reports;
	private Date video_date;
	private int video_rank_limit;
	
	private String orgin_video_name;
	private String stored_video_name;
	private String orgin_video_thumb;
	private String stored_video_thumb;
}
