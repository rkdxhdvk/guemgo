package com.guem.go.eunbyul;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.guem.go.minsu.MatchingVo;

@Repository
public class OngoingDao {
	@Autowired
	private SqlSession sqlSession;
	private final static String NAMESPACE="com.guem.go.mybatis.OnclassMapper";

	
	public List<RequireVo> select_ongoing(String email){
		return sqlSession.selectList(NAMESPACE+ ".select_ongoing", email);
	}
	public RequirelistVo select_email(int num) {
		return sqlSession.selectOne(NAMESPACE+ ".select_list", num);
	}
	public LectureVo select_lec(int num) {
		return sqlSession.selectOne(NAMESPACE+ ".select_lec", num);
	}
	
	
	public List<MatchingVo> matchselect(String email) {
		return sqlSession.selectList(NAMESPACE+ ".matchselect", email);
	}
}

