package com.example.demo.mypage.dto;

import lombok.Data;
import lombok.Getter;

/*
-- 비디오 테이블 
CREATE TABLE video (
	video_number	INT	NOT NULL auto_increment,
	user_id	VARCHAR(20)	NOT NULL,
	category_code	VARCHAR(10)	NOT NULL,
	video_title	VARCHAR(150) NOT NULL,
	public_check	CHAR(1)	NOT NULL,
	video_hits	INT	NOT NULL DEFAULT 0,
	video_reports	INT	NOT NULL DEFAULT 0,
	video_date	DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	video_rank_limit INT NOT NULL DEFAULT 0,
    PRIMARY KEY(video_number)
);
 */
@Data
public class VideoDto {
	
	private int video_number;
	private String user_id;
	private String category_code;
	private String video_title;
	private char public_check;
	private int video_hits;
	private int video_reports;
	private String video_date;
	private int video_rank_limit;
	
	
}






















