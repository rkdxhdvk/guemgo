package com.guem.go.woohyun;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/*
	2018-10-29	������ ���� ����
*/
@Service
public class MemberService {
	@Autowired private MemberDao dao;
	public void setDao(MemberDao dao) {
		this.dao = dao;
	}	
	// ȸ������ 
	public int insert(MemberVo vo) {
		return dao.insert(vo);
	}
	
	// ȸ������Ʈ ��ȸ
	public List<MemberVo> list(){
		return dao.list();
	}
	
	// ȸ������
	public int delete(String email) {
		return dao.delete(email);
	}
	
	// ȸ�� ���� ����(1�� ��ȸ)
	public MemberVo detail(String email) {
//		System.out.println("���� ��ȸ�κ�");
//		System.out.println(email);
		return dao.detail(email);
	}
	
	// ȸ�� ���� ����(������Ʈ)
	public int update(MemberVo vo) {
//		System.out.println("���� �κ�");
		return dao.update(vo);
	}
}
