package com.guem.go.eunbyul;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class StatisticsDao {
	@Autowired
	private SqlSession sqlSession;
	private final static String NAMESPACE="com.guem.go.mybatis.StatiMapper";
	
	public long countusers() {
		return sqlSession.selectOne(NAMESPACE+".countusers");
	}
	public long countgosu() {
		return sqlSession.selectOne(NAMESPACE+".countgosu");
	}

}
