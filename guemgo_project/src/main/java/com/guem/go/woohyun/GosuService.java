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
	
	// �������Ʈ ��ȸ
	public List<GosuVo> list(){
		return dao.list();
	}
	
	// ��� ����
	public int delete(String email) {
		return dao.delete(email);
	}
	
	// ��� ���� ����(1�� ��ȸ)
	public GosuVo detail(String email) {
		return dao.detail(email);
	}
	
	// ��� ���� ����(������Ʈ)
	public int update(GosuVo vo) {
		return dao.update(vo);
	}
	// ��� ���� ����(������Ʈ)
	public int update_user(GosuVo vo) {
		return dao.update_user(vo);
	}
	
}
