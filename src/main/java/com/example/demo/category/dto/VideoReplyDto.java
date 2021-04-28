package com.example.demo.category.dto;

import java.util.Date;

import lombok.Data;

/*
 	CREATE TABLE `video_reply` (
	`reply_number`	INT	NOT NULL AUTO_INCREMENT,
	`video_number`	INT	NOT NULL,
	`reply_content`	VARCHAR(100) NOT NULL,
    `reply_register`VARCHAR(20) NOT NULL,
	`reply_insert_date`	DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`reply_orgin_number` INT NOT NULL,
	`reply_order`	INT	NOT NULL,
	`reply_depth`	INT	NOT NULL,
    primary key(reply_number)
)	;
 */

@Data
public class VideoReplyDto {
	
	private int reply_number;
	private int video_number;
	private String reply_content;
	private String reply_register;
	private Date reply_insert_date;
	private int reply_orgin_number;
	private int reply_order;
	private int reply_depth;
}





















