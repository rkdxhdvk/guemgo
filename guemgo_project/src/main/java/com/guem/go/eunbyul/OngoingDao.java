package com.guem.go.eunbyul;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class OngoingDao {
	private SqlSession sqlSession;

	private final static String NAMESPACE="com.guem.go.mybatis.OnclassMapper";
	
	public List<RequireVo> select_ongoing(String email){
		return sqlSession.selectList(NAMESPACE+".select_onreq", email);
	}
	public String select_email(int num) {
		return sqlSession.selectOne(NAMESPACE+".select_email", num);
	}
	
}
