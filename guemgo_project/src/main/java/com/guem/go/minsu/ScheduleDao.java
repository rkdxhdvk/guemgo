package com.guem.go.minsu;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ScheduleDao {
	@Autowired
	private SqlSession sqlSession;
	private final static String NAMESPACE = "com.guem.go.mybatis.ScheduleMapper";
	
	public int insert(ScheduleVo vo) {
		return sqlSession.insert(NAMESPACE + ".scheduleInsert",vo);
	}
	public int scheduleNum() {
		return sqlSession.selectOne(NAMESPACE + ".scheduleNum");
	}
	public int schedelete(int scheduleNum) {
		return sqlSession.delete(NAMESPACE + ".schedelete", scheduleNum);
	}
	public List<ScheduleVo> scheList(String email){
		return sqlSession.selectList(NAMESPACE + ".schelist", email);
	}
	public List<ScheduleVo> userscheList(String other){
		return sqlSession.selectList(NAMESPACE + ".userschelist", other);
	}
	public ScheduleVo isschedule(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE + ".isschedule", map);
	}
}
