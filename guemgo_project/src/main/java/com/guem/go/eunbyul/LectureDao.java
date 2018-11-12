package com.guem.go.eunbyul;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class LectureDao {
	@Autowired
	private SqlSession sqlSession;
	private final static String NAMESPACE="com.guem.go.mybatis.ClassMapper";
	

	public int classdelete(int lecNum) {
		return sqlSession.delete(NAMESPACE+".classdelete", lecNum);
	}

}
