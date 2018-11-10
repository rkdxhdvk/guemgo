package com.guem.go.minsu;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MatchingDao {
	@Autowired
	private SqlSession sqlSession;
	private final static String NAMESPACE = "com.guem.go.mybatis.MatchingMapper";
	
	public int insert(MatchingVo vo) {
		return sqlSession.insert(NAMESPACE + ".matchingInsert",vo);
	}
}
