package com.example.demo.user.dto;
/*
 	-- 회원 테이블 
	create table user(
		user_id varchar(20) not null,
	    user_pwd varchar(100) not null,
	    user_nickname varchar(20) not null,
	    user_status char(1) not null,
	    user_exp int not null default 0,
	    user_rank varchar(20) not null,
	    user_insertdate datetime DEFAULT CURRENT_TIMESTAMP not null, 
	    user_leavedate datetime null,
	    PRIMARY KEY(user_id)
    );
 */
public class UserDto {

	private String user_id;
	private String user_pwd;
	private String user_nickname;
	private int user_point;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public int getUser_point() {
		return user_point;
	}
	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}
	
	
}
