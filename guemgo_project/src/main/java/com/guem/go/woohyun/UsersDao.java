package com.guem.go.woohyun;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;




@Repository
public class UsersDao {
	@Autowired private SqlSession sqlSession;
	private static final String NAMESPACE="com.guem.go.mybatis.UsersMapper";
	public void setSession(SqlSession session) {
		this.sqlSession = sqlSession;
	}
	
	// 회원가입 DAO
	public int insert(UsersVo vo) {
		return sqlSession.insert(NAMESPACE + ".insert",vo);
	}
	
	// 회원리스트 조회 DAO
	public List<UsersVo> list(){
		return sqlSession.selectList(NAMESPACE + ".list");
	}
	
	// 회원삭제 DAO
	public int delete(String email) {
		return sqlSession.delete(NAMESPACE + ".delete",email);
	}
	
	// 회원 정보 수정(1명 조회) DAO
	public UsersVo detail(String email) {
		return sqlSession.selectOne(NAMESPACE +".detail",email);
	}
	
	// 회원 정보 수정(업데이트) DAO
	public int update(UsersVo vo) {
		System.out.println("DAO 업데이트 부분");
		return sqlSession.update(NAMESPACE + ".update",vo); 
	}
	
}
