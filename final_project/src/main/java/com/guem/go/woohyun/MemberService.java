package com.guem.go.woohyun;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/*
	2018-10-29	윤우현 파일 생성
*/
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
	
	// 회원리스트 조회
	public List<MemberVo> list(){
		return dao.list();
	}
	
	// 회원삭제
	public int delete(int mnum) {
		return dao.delete(mnum);
	}
	
	// 회원 정보 수정(1명 조회)
	public MemberVo detail(int mnum) {
		System.out.println("서비스 조회부분");
		System.out.println(mnum);
		return dao.detail(mnum);
	}
	
	// 회원 정보 수정(업데이트)
	public int update(MemberVo vo) {
		System.out.println("서비스 부분");
		System.out.println(vo.getMnum());
		System.out.println(vo.getName());
		System.out.println(vo.getPwd());
		System.out.println(vo.getMlev());
		System.out.println(vo.getMimg());
		System.out.println(vo.getPoint());
		return dao.update(vo);
	}
}
