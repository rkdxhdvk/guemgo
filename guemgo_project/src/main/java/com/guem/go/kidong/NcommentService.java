package com.guem.go.kidong;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NcommentService {
	@Autowired
	private NcommentDao dao;
	
	public int getMaxNum(int num) {
		return dao.getMaxNum(num);
	}
	
	public int getCount(int num) {
		return dao.getCount(num);
	}
	
	public int insert(NcommentVo NcommentVo) {
		return dao.insert(NcommentVo);
	}
	
	public int insertReply(Map<String, Object> map) {
		return dao.insertReply(map);
	}
	
	public List<NcommentVo> list(int num) {
		return dao.list(num);
	}
	public int update(NcommentVo vo) {
		return dao.update(vo);
	}
	
	public int delete(int cnum) {
		return dao.delete(cnum);
	}
	
	public int deleteRef(int ref) {
		return dao.deleteRef(ref);
	}
}
