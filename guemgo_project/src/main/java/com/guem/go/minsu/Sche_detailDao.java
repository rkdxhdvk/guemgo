package com.guem.go.minsu;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Sche_detailDao {
	@Autowired
	private SqlSession sqlSession;
	private final static String NAMESPACE = "com.guem.go.mybatis.Sche_detailMapper";
	
	public int insert(Sche_detailVo vo) {
		return sqlSession.insert(NAMESPACE + ".insert",vo);
	}
	public int sche_detailNum() {
		return sqlSession.selectOne(NAMESPACE + ".detailNum");
	}
	public int update(Sche_detailVo vo) {
		return sqlSession.update(NAMESPACE + ".detailUpdate", vo);
	}
	public Sche_detailVo sche_detail(int schedetailNum) {
		return sqlSession.selectOne(NAMESPACE + ".sche_detail", schedetailNum);
	}
	public List<Sche_detailVo> scheList(int scheduleNum){
		return sqlSession.selectList(NAMESPACE + ".sche_detailList", scheduleNum);
	}
	public int Sche_detailDelete(int schedetailNum) {
		return sqlSession.delete(NAMESPACE + ".sche_detailDelete", schedetailNum);
	}
	public int all_detailDelete(int scheduleNum) {
		return sqlSession.delete(NAMESPACE + ".all_detailDelete", scheduleNum);
	}
}
