package com.guem.go.woohyun;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



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
	
	// ȸ����������Ʈ
	public List<MemberVo> list(){
		return dao.list();
	}
	
	// ȸ������
	public int delete(int mnum) {
		return dao.delete(mnum);
	}
	
}
