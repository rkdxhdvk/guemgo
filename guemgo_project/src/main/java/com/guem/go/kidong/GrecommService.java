package com.guem.go.kidong;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GrecommService {
	@Autowired
	private GrecommDao dao;
	
	public int insert(GrecommVo vo) {
		return dao.insert(vo);
	}
	
	public GrecommVo isRecomm(GrecommVo vo) {
		return dao.isRecomm(vo);
	}
	
	public int getRecommCount(int num) {
		return dao.getRecommCount(num);
	}
	
	public int delete(GrecommVo vo) {
		return dao.delete(vo);
	}
	
	public List<GrecommVo> list() {
		return dao.list();
	}
}
