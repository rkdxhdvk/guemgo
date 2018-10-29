package com.guem.go.woohyun;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MemberService {
	@Autowired private MemberDao dao;
	
	// 회원가입
	public int insert(MemberVo vo) {
		return dao.insert(vo);
	}
	
	// 회원정보리스트
	public List<MemberVo> list(){
		return dao.list();
	}
}
