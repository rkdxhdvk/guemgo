package com.guem.go.minsu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MatchingService{
	@Autowired
	private MatchingDao dao;
	
	public int insert(MatchingVo vo) {
		return dao.insert(vo);
	}
}
