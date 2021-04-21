package com.example.demo.user.dto;

import java.util.Date;

import lombok.Data;

/*
 	-- 회원 테이블 
CREATE TABLE `user` (
	`user_id`	VARCHAR(20)	NOT NULL,
	`user_pwd`	VARCHAR(100)	NOT NULL,
	`user_nickname`	VARCHAR(20)	NOT NULL,
	`user_exp`	INT	NOT NULL	DEFAULT 0,
	`user_rank`	VARCHAR(20)	NOT NULL DEFAULT 'Bronze',
	`user_rank_code`	INT	NOT NULL DEFAULT 1,
	`user_insertdate`	DATETIME	NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`user_leavedate`	DATETIME	NULL
);
 */

@Data
public class UserDto {

	private String user_id;
	private String user_pwd;
	private String user_nickname;
	private int user_exp;
	private String user_rank;
	private int user_rank_code;	
	private Date user_insertdate;
	private Date user_leavedate;
	
}
