package com.example.demo.user.dto;

import java.util.Date;

import lombok.Data;

/*
 	-- 회원 테이블 
create table user(
	user_id varchar(20) not null,
    user_pwd varchar(100) not null,
    user_nickname varchar(20) not null,
    user_exp int not null default 0,
    user_rank varchar(20) default 'Bronze' not null,
    user_insertdate datetime DEFAULT CURRENT_TIMESTAMP not null, 
    user_leavedate datetime null,
    PRIMARY KEY(user_id)
    );
 */

@Data
public class UserDto {

	private String user_id;
	private String user_pwd;
	private String user_nickname;
	private int user_exp;
	private String user_rank;		
	private Date user_insertdate;
	private Date user_leavedate;
	
}
