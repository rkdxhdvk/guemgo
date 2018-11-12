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
	
	// ������� DAO
	public int insert(GosuVo vo) {
		return sqlSession.insert(NAMESPACE + ".insert",vo);
	}
	
	//	??
	public int gosuNum(String email) {
		return sqlSession.selectOne(NAMESPACE + ".gosuNum", email);
	}

	// �������Ʈ ��ȸ DAO
	public List<GosuVo> list(){
		return sqlSession.selectList(NAMESPACE + ".list");
	}
	
	// ��� ���� DAO
	public int delete(String email) {
		return sqlSession.delete(NAMESPACE + ".delete",email);
	}
	
	// ��� ���� ����(1�� ��ȸ) DAO
	public GosuVo detail(String email) {
		return sqlSession.selectOne(NAMESPACE + ".detail", email); 
	}
	
	// ��� ���� ����(������Ʈ) DAO
	public int update(GosuVo vo) {
		return sqlSession.update(NAMESPACE + ".update", vo);
	}
	// ��� ���� ����(������Ʈ) DAO
	public int update_user(GosuVo vo) {
		return sqlSession.update(NAMESPACE + ".update_user", vo);
	}
		
}
