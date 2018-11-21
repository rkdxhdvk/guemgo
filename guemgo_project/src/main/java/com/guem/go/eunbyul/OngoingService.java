package com.guem.go.eunbyul;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class OngoingService {
	private OngoingDao dao;
	
	public List<RequireVo> select_ongoing(String email){
		return dao.select_ongoing(email);
	}
	public String select_email(int num) {
		return dao.select_email(num);
	}
}
