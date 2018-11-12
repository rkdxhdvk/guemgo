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
	
	//	??
	public int gosuNum(String email) {
		return sqlSession.selectOne(NAMESPACE + ".gosuNum", email);
	}

	// 고수리스트 조회 DAO
	public List<GosuVo> list(){
		return sqlSession.selectList(NAMESPACE + ".list");
	}
	
	// 고수 삭제 DAO
	public int delete(String email) {
		return sqlSession.delete(NAMESPACE + ".delete",email);
	}
	
	// 고수 정보 수정(1명 조회) DAO
	public GosuVo detail(String email) {
		return sqlSession.selectOne(NAMESPACE + ".detail", email); 
	}
	
	// 고수 정보 수정(업데이트) DAO
	public int update(GosuVo vo) {
		return sqlSession.update(NAMESPACE + ".update", vo);
	}
	// 고수 정보 수정(업데이트) DAO
	public int update_user(GosuVo vo) {
		return sqlSession.update(NAMESPACE + ".update_user", vo);
	}
		
}
