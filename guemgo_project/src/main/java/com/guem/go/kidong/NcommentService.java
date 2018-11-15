package com.guem.go.kidong;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NcommentService {
	@Autowired
	private NcommentDao dao;
	
	public int getCount(int num) {
		return dao.getCount(num);
	}
	
	public int insert(NcommentVo vo) {
		return dao.insert(vo);
	}
	
	public int insertReply(NreplyVo vo) {
		return dao.insertReply(vo);
	}
	
	public List<NreplyVo> replys(int cnum){
		return dao.replys(cnum);
	}
	
	public List<CommentsVo> list(int num) {
		return dao.list(num);
	}
	
	public CommentsVo getInfo(int num) {
		return dao.getInfo(num);
	}
	
	public int update(NcommentVo vo) {
		return dao.update(vo);
	}
	
	public int delete(int cnum) {
		return dao.delete(cnum);
	}
	
	public int deleteReply(int num) {
		return dao.deleteReply(num);
	}
}
