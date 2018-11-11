package com.guem.go.minsu;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Re_commentDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	private final static String NAMESPACE = "com.guem.go.mybatis.Re_commentMapper";
	
	public int insert(Re_commentVo vo) {
		return sqlsession.insert(NAMESPACE + ".insert", vo);
	}
	
	public List<Re_commentVo> list(int reviewNum){
		return sqlsession.selectList(NAMESPACE + ".list", reviewNum);
	}
	
	public int getCount(int reviewNum) {
		return sqlsession.selectOne(NAMESPACE + ".getCount", reviewNum);
	}
	
	public int delete(int commentNum) {
		return sqlsession.delete(NAMESPACE + ".delete", commentNum);
	}
	
	public int update(Re_commentVo vo) {
		return sqlsession.update(NAMESPACE + ".update", vo);
	}
}
