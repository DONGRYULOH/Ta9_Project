package com.example.demo.user.dto;
/*
 	create table user(
	user_id varchar(20) not null,
    user_pwd varchar(30) not null,
    user_nickname varchar(20) not null,
    user_role_code int not null default 101,
    user_role_name varchar(20) not null default 'normal_role',
    user_point int not null default 0,
    PRIMARY KEY(user_id)
    );
 */
public class UserDto {

	private String user_id;
	private String user_pwd;
	private String user_nickname;
	private int user_role_code;
	private String user_role_name;
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
	public int getUser_role_code() {
		return user_role_code;
	}
	public void setUser_role_code(int user_role_code) {
		this.user_role_code = user_role_code;
	}
	public String getUser_role_name() {
		return user_role_name;
	}
	public void setUser_role_name(String user_role_name) {
		this.user_role_name = user_role_name;
	}
	public int getUser_point() {
		return user_point;
	}
	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}
	
	
}