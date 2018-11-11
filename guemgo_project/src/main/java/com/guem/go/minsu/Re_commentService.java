package com.guem.go.minsu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Re_commentService {
	@Autowired
	private Re_commentDao dao;
	
	public int insert(Re_commentVo vo) {
		return dao.insert(vo);
	}
	
	public List<Re_commentVo> list(int reviewNum){
		return dao.list(reviewNum);
	}
	
	public int getCount(int reviewNum) {
		return dao.getCount(reviewNum);
	}
	
	public int delete(int commentNum) {
		return dao.delete(commentNum);
	}
	
	public int update(Re_commentVo vo) {
		return dao.update(vo);
	}
}
