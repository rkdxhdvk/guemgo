package com.guem.go.kidong;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GboardDao {
	@Autowired
	private SqlSession session;

	private final static String NAMESPACE = "com.guem.go.mybatis.GboardMapper.";

	public int insert(GboardVo vo) {
		return session.insert(NAMESPACE +"insert", vo);
	}

	public List<GboardVo> list(Map<String, Object> map) {
		return session.selectList(NAMESPACE +"list", map);
	}

	public int getCount(Map<String, Object> map) {
		return session.selectOne(NAMESPACE +"getCount", map);
	}

	public GboardVo detail(int num) {
		return session.selectOne(NAMESPACE +"detail", num);
	}

	public List<GcommentVo> commentList(int num) {
		return session.selectList(NAMESPACE +"commentList", num);
	}

	public int hitUp(int num) {
		return session.update(NAMESPACE +"hitUp", num);
	}

	public int recommUp(Map<String, Object> map) {
		return session.update(NAMESPACE +"recommUp", map);
	}

	public int commentUp(Map<String, Object> map) {
		return session.update(NAMESPACE +"commentUp", map);
	}

	public int update(GboardVo vo) {
		return session.update(NAMESPACE +"update", vo);
	}

	public int delete(int num) {
		return session.delete(NAMESPACE +"delete", num);
	}
	
	public GboardVo next(int num) {
		return session.selectOne(NAMESPACE + "next", num);
	}
	
	public GboardVo prev(int num) {
		return session.selectOne(NAMESPACE + "prev", num);
	}
}









