package com.guem.go.eunbyul;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class CateDao {
	@Autowired
	private SqlSession sqlSession;
	
	private final static String NAMESPACE="com.guem.go.mybatis.CateMapper";

	public List<CatemVo> catemlist() {
		return sqlSession.selectList(NAMESPACE + ".catemlist");
	}
	public List<CatesVo> selectcates(String mname) {
		return sqlSession.selectList(NAMESPACE+".selectcates",mname);
	}
	public List<CatesVo> cateslist() {
		return sqlSession.selectList(NAMESPACE+".cateslist");
	}
	public List<CatelVo> catellist() {
		return sqlSession.selectList(NAMESPACE+".catellist");
	}
}
