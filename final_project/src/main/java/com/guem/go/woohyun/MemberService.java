package com.guem.go.woohyun;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MemberService {
	@Autowired private MemberDao dao;
	
	// ȸ������
	public int insert(MemberVo vo) {
		return dao.insert(vo);
	}
	
	// ȸ����������Ʈ
	public List<MemberVo> list(){
		return dao.list();
	}
}
