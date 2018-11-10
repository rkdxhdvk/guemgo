package com.guem.go.woohyun;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GosuDao {
	@Autowired private SqlSession sqlSession;
	private static final String NAMESPACE="com.guem.go.mybatis.GosuMapper";
	public void setSession(SqlSession session) {
		this.sqlSession = sqlSession;
	}
	
	// 고수가입 DAO
	public int insert(GosuVo vo) {
		return sqlSession.insert(NAMESPACE + ".insert",vo);
	}
	
	public int gosuNum(String email) {
		return sqlSession.selectOne(NAMESPACE + ".gosuNum", email);
	}
}
