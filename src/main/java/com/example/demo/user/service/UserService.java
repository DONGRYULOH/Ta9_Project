package com.example.demo.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.user.dao.UserDao;
import com.example.demo.user.dto.UserDto;

@Service
public class UserService {

	@Autowired
	private UserDao userdao;

	public String signIn() throws Exception {
		return userdao.signIn();
	}
}
