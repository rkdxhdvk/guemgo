package com.guem.go.eunbyul;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SurveyDao {
	@Autowired
	private SqlSession sqlSession;
	private final static String NAMESPACE="com.guem.go.mybatis.SurveyMapper";
	
	public int insert(RequireVo vo) {
		return sqlSession.insert(NAMESPACE+".requireInsert",vo);
	}
	
	public CatemVo selectcatem(String name) {
		return sqlSession.selectOne(NAMESPACE+".selectcatem",name);
	}
}
