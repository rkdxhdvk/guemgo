package com.guem.go.woohyun;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE="com.guem.go.mybatis.MemberMapper";
	public void setSession(SqlSession session) {
		this.sqlSession = sqlSession;
	}
	public int insert(MemberVo vo) {
		return sqlSession.insert(NAMESPACE + ".insert",vo);
	}
}
