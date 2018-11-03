package com.guem.go.woohyun;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
/*
	2018-10-31	辣快泅 颇老 积己
*/
@Service
public class LoginService {
	@Autowired private LoginDao dao;
	public MemberVo isMember(HashMap<String,String> map) {
		return dao.isMember(map);
	}
}













