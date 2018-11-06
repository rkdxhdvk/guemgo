package com.guem.go.woohyun;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/*
	2018-10-29	������ ���� ����
*/
@Service
public class UsersService {
	@Autowired private UsersDao dao;
	public void setDao(UsersDao dao) {
		this.dao = dao;
	}	
	// ȸ������ 
	public int insert(UsersVo vo) {
		return dao.insert(vo);
	}
	
	// ȸ������Ʈ ��ȸ
	public List<UsersVo> list(){
		return dao.list();
	}
	
	// ȸ������
	public int delete(String email) {
		return dao.delete(email);
	}
	
	// ȸ�� ���� ����(1�� ��ȸ)
	public UsersVo detail(String email) {
//		System.out.println("���� ��ȸ�κ�");
//		System.out.println(email);
		return dao.detail(email);
	}
	
	// ȸ�� ���� ����(������Ʈ)
	public int update(UsersVo vo) {
//		System.out.println("���� �κ�");
		return dao.update(vo);
	}
}