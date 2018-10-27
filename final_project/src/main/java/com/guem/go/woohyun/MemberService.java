package com.guem.go.woohyun;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	@Autowired private MemberDao dao;
	public int insert(MemberVo vo) {
		return dao.insert(vo);
	}
}
