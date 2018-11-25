package com.guem.go.minsu;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDao {
	@Autowired
	private SqlSession sqlSession;
	private final static String NAMESPACE = "com.guem.go.mybatis.Review_boardMapper";
	
	public int insert(ReviewVo vo) {
		return sqlSession.insert(NAMESPACE + ".insert",vo);
	}
	public List<ReviewVo> list(Map<String, Object> map) {
		return sqlSession.selectList(NAMESPACE +".list", map);
	}
	public List<ReviewVo> relist() {
		return sqlSession.selectList(NAMESPACE +".relist");
	}
	public int getCount(Map<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE +".getCount", map);
	}
	public ReviewVo detail(int reviewNum) {
		return sqlSession.selectOne(NAMESPACE +".detail", reviewNum);
	}
	public int update(ReviewVo vo) {
		return sqlSession.update(NAMESPACE + ".update", vo);
	}
	public int delete(int reviewNum) {
		return sqlSession.delete(NAMESPACE + ".delete", reviewNum);
	}
	public List<Re_commentVo> commentList(int reviewNum) {
		return sqlSession.selectList(NAMESPACE + ".commentList", reviewNum);
	}
	public int hit(int reviewNum) {
		return sqlSession.update(NAMESPACE + ".hit", reviewNum);
	}
	public int commentUp(Map<String, Object> map) {
		return sqlSession.update(NAMESPACE +".commentUp", map);
	}
	
	public int totalReview() {
		return sqlSession.selectOne(NAMESPACE + ".totalReview");
	}
	
	public int totalStar() {
		return sqlSession.selectOne(NAMESPACE + ".totalStar");
	}
}
