package com.guem.go.minsu;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ReviewService{
	@Autowired
	private ReviewDao dao;
	
	public int insert(ReviewVo vo) {
		return dao.insert(vo);
	}
	public List<ReviewVo> list(Map<String, Object> map){
		return dao.list(map);
	}
	public int getCount(Map<String, Object> map) {
		return dao.getCount(map);
	}
	public ReviewVo detail(int reviewNum) {
		return dao.detail(reviewNum);
	}
	public int update(ReviewVo vo) {
		return dao.update(vo);
	}
	public int delete(int reviewNum) {
		return dao.delete(reviewNum);
	}
	public List<Re_commentVo> commentList(int reviewNum){
		return dao.commentList(reviewNum);
	}
	public int hit(int reviewNum) {
		return dao.hit(reviewNum);
	}
	public int commentUp(Map<String, Object> map) {
		return dao.commentUp(map);
	}
}
