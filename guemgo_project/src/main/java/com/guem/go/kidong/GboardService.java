package com.guem.go.kidong;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GboardService {
	@Autowired
	private GboardDao dao;
	
	public int insert(GboardVo vo) {
		return dao.insert(vo);
	}
	
	public List<GboardVo> list(Map<String, Object> map){
		return dao.list(map);
	}
	
	public int getCount(Map<String, Object> map) {
		return dao.getCount(map);
	}
	
	public GboardVo detail(int num) {
		return dao.detail(num);
	}
	public List<GcommentVo> commentList(int num){
		return dao.commentList(num);
	}
	
	public int hitUp(int num) {
		return dao.hitUp(num);
	}
	
	public int recommUp(Map<String, Object> map) {
		return dao.recommUp(map);
	}
	
	public int commentUp(Map<String, Object> map) {
		return dao.commentUp(map);
	}
	
	public int update(GboardVo vo) {
		return dao.update(vo);
	}
	
	public int delete(int num) {
		return dao.delete(num);
	}
	
	public GboardVo next(int num) {
		return dao.next(num);
	}
	
	public GboardVo prev(int num) {
		return dao.prev(num);
	}
}











