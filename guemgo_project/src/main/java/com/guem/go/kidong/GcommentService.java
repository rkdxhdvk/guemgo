package com.guem.go.kidong;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GcommentService {
	@Autowired
	private GcommentDao dao;
	
	public int insert(GcommentVo vo) {
		return dao.insert(vo);
	}
	
	public List<GcommentVo> list(int num){
		return dao.list(num);
	}
	
	public int getCount(int num) {
		return dao.getCount(num);
	}
	
	public int delete(int cnum) {
		return dao.delete(cnum);
	}
}
