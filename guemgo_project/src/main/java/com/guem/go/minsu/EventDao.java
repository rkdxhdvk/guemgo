package com.guem.go.minsu;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class EventDao {
	@Autowired 
	private SqlSession sqlSession;
	
	private final static String NAMESPACE = "com.guem.go.mybatis.EventMapper";
	
	public int insert(EventVo vo) {
		return sqlSession.insert(NAMESPACE + ".eventinsert",vo);
	}
	public List<EventVo> list(String email){
		return sqlSession.selectList(NAMESPACE + ".eventlist", email);
	}
}
