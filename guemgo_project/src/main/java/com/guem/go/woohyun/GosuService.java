package com.guem.go.woohyun;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/*
---------------------------------------------
	2018-11-02	������ ���� ����
---------------------------------------------
*/
@Service
public class GosuService {
	@Autowired private GosuDao dao;
	public void setDao(GosuDao dao) {
		this.dao = dao;
	}	
	
	// ������ 
	public int insert(GosuVo vo) {
		return dao.insert(vo);
	}
	
	//����ѹ�  
	public int gosuNum(String email) {
		return dao.gosuNum(email);
	}
	
}
