package com.example.demo.user.dto;

import lombok.Data;

/*
 	-- 비디오 위시리스트 테이블 
CREATE TABLE `video_cart` (
	`video_cart_number`	INT	NOT NULL AUTO_INCREMENT,
	`user_id`	VARCHAR(20)	NOT NULL,
	`video_number`	INT	NOT NULL,
    PRIMARY KEY(video_cart_number)
);
 */

@Data
public class VideoCartDto {
	
	private int video_cart_number;
	private String user_id;
	private int video_number;
}
