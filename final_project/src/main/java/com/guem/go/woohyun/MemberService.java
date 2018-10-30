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
	// 회원가입
	public int insert(MemberVo vo) {
		return dao.insert(vo);
	}
	
	// 회원정보리스트
	public List<MemberVo> list(){
		return dao.list();
	}
	
	// 회원삭제
	public int delete(int mnum) {
		return dao.delete(mnum);
	}
	
}
