package com.guem.go.minsu;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ScheduleDao {
	@Autowired
	private SqlSession sqlSession;
	private final static String NAMESPACE = "com.guem.go.mybatis.ScheduleMapper";
	
	public int insert(ScheduleVo vo) {
		return sqlSession.insert(NAMESPACE + ".scheinsert",vo);
	}
	public int scheduleNum() {
		return sqlSession.selectOne(NAMESPACE + ".scheduleNum");
	}
}
