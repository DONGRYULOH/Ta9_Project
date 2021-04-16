package com.example.demo.user.dto;

import lombok.Data;

/*
 	-- 회원 상태 테이블 
CREATE TABLE `user_st` (
	`user_id`	VARCHAR(20)	NOT NULL,
	`user_status`	INT	default '1' NOT NULL,
	`user_status_name`	VARCHAR(20) default '일반' NOT NULL    
);
 */

@Data
public class UserStDto {
	private String user_id;
	private int user_status;
	private String user_status_name;
}
