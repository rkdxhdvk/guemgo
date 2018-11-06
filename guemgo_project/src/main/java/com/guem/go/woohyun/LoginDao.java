package com.guem.go.woohyun;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
/*
	2018-10-31	辣快泅 颇老 积己
*/
@Repository
public class LoginDao {
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE="com.guem.go.mybatis.LoginMapper";
	public UsersVo isMember(HashMap<String,String> map) {
		return sqlSession.selectOne(NAMESPACE+".isMember",map);
	}
}

















