package com.guem.go.minsu;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Sche_detailDao {
	@Autowired
	private SqlSession sqlSession;
	private final static String NAMESPACE = "com.guem.go.mybatis.Sche_detailMapper";
	
	public int insert(Sche_detailVo vo) {
		int n = sqlSession.insert(NAMESPACE + ".sche_detailinsert",vo);
		return n;
	}
	public int sche_detailNum() {
		return sqlSession.selectOne(NAMESPACE + ".detailNum");
	}
}
