package com.guem.go.woohyun;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CateDao {
	@Autowired private SqlSession sqlSession;
	private static final String NAMESPACE="com.guem.go.mybatis.CateMapper";
	public void setSession(SqlSession session) {
		this.sqlSession = sqlSession;
	}
	
	// cate_l 조회 DAO
		public List<CateVo> cate_l_list(){
			return sqlSession.selectList(NAMESPACE + ".cate_l_list");
		}
		
	// cate_m 조회 DAO
		public List<CateVo> cate_m_list(){
			return sqlSession.selectList(NAMESPACE + ".cate_m_list");
		}
}
