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
	public int delete(String email) {
		return dao.delete(email);
	}
	
	// 회원 정보 수정(1명 조회)
	public MemberVo detail(String email) {
//		System.out.println("서비스 조회부분");
//		System.out.println(email);
		return dao.detail(email);
	}
	
	// 회원 정보 수정(업데이트)
	public int update(MemberVo vo) {
//		System.out.println("서비스 부분");
		return dao.update(vo);
	}
}
