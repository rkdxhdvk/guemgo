package com.guem.go.woohyun;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/*
---------------------------------------------
	2018-11-02	윤우현 파일 생성
---------------------------------------------
*/
@Service
public class GosuService {
	@Autowired private GosuDao dao;
	public void setDao(GosuDao dao) {
		this.dao = dao;
	}	
	
	// 고수등록 
	public int insert(GosuVo vo) {
		return dao.insert(vo);
	}
	
	//고수넘버  
	public int gosuNum(String email) {
		return dao.gosuNum(email);
	}
	
}
