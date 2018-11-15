package com.guem.go.kidong;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NreplyService {
	@Autowired
	private NreplyDao dao;
	
	public int getCount(int cnum) {
		return dao.getCount(cnum);
	}
	
	public int insert(NreplyVo vo) {
		return dao.insert(vo);
	}
	
	public List<NreplyVo> list(int cnum) {
		return dao.list(cnum);
	}
	public int update(NreplyVo vo) {
		return dao.update(vo);
	}
	
	public int delete(int num) {
		return dao.delete(num);
	}
}
