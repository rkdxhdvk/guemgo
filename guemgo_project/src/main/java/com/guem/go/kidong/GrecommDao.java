package com.guem.go.kidong;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GrecommDao {
	@Autowired
	private SqlSession session;
	
	public int insert(GrecommVo vo) {
		return session.insert("com.guem.go.mybatis.GrecommMapper.insert", vo);
	}
	
	public GrecommVo isRecomm(GrecommVo vo) {
		return session.selectOne("com.guem.go.mybatis.GrecommMapper.isRecomm", vo);
	}
	
	public int getRecommCount(int num) {
		return session.selectOne("com.guem.go.mybatis.GrecommMapper.getRecommCount", num);
	}
	
	public int delete(GrecommVo vo) {
		return session.delete("com.guem.go.mybatis.GrecommMapper.delete", vo);
	}
	
	public List<GrecommVo> list() {
		return session.selectList("com.guem.go.mybatis.GrecommMapper.list");
	}
	
}
