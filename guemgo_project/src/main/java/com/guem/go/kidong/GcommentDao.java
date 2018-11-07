package com.guem.go.kidong;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GcommentDao {
	@Autowired
	private SqlSession session;
	
	public int insert(GcommentVo vo) {
		return session.insert("com.guem.go.mybatis.GcommentMapper.insert", vo);
	}
	
	public List<GcommentVo> list(int num){
		return session.selectList("com.guem.go.mybatis.GcommentMapper.list", num);
	}
	
	public int getCount(int num) {
		return session.selectOne("com.guem.go.mybatis.GcommentMapper.getCount", num);
	}
	
	public int delete(int cnum) {
		return session.delete("com.guem.go.mybatis.GcommentMapper.delete", cnum);
	}
}
