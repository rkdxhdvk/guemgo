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
	public int delete(int mnum) {
		return dao.delete(mnum);
	}
	
	// ȸ�� ���� ����(1�� ��ȸ)
	public MemberVo detail(int mnum) {
		System.out.println("���� ��ȸ�κ�");
		System.out.println(mnum);
		return dao.detail(mnum);
	}
	
	// ȸ�� ���� ����(������Ʈ)
	public int update(MemberVo vo) {
		System.out.println("���� �κ�");
		return dao.update(vo);
	}
}
