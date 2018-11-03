package com.guem.go.woohyun;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
/*
	2018-10-31	윤우현 파일 생성
*/
@Repository
public class LoginDao {
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE="com.guem.go.mybatis.LoginMapper";
	public MemberVo isMember(HashMap<String,String> map) {
		return sqlSession.selectOne(NAMESPACE+".isMember",map);
	}
}

















