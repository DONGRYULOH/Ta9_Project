package com.example.demo.user.dao;

import org.springframework.context.annotation.Configuration;

import com.example.demo.user.dto.UserDto;


public interface UserDao {

	// ----------- 로그인 확인 ----------
    public String signIn() throws Exception;
}
