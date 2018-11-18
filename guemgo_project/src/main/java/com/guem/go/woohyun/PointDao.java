package com.guem.go.woohyun;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PointDao {
	@Autowired private SqlSession sqlSession;
	private static final String NAMESPACE="com.guem.go.mybatis.PointMapper";
	public void setSession(SqlSession session) {
		this.sqlSession = sqlSession;
	}
	
	// 포인트 이력 조회 DAO
	public List<PointVo> list(String email){
		return sqlSession.selectList(NAMESPACE + ".list",email); 
	}
	
	//포인트 이력 추가 DAO
	public int insert(PointVo vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}
	
}
