package com.guem.go.kidong;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NboardDao {
	@Autowired
	private SqlSession session;

	private final static String NAMESPACE = "com.guem.go.mybatis.NboardMapper.";

	public int insert(NboardVo vo) {
		return session.insert(NAMESPACE + "insert", vo);
	}

	public List<NboardVo> list(Map<String, Object> map) {
		return session.selectList(NAMESPACE + "list", map);
	}

	public int getCount(Map<String, Object> map) {
		return session.selectOne(NAMESPACE + "getCount", map);
	}

	public NboardVo detail(int num) {
		return session.selectOne(NAMESPACE + "detail", num);
	}

	public int hitUp(int num) {
		return session.update(NAMESPACE + "hitUp", num);
	}

	public int update(NboardVo vo) {
		return session.update(NAMESPACE + "update", vo);
	}

	public int delete(int num) {
		return session.delete(NAMESPACE + "delete", num);
	}

	public NboardVo next(int num) {
		return session.selectOne(NAMESPACE + "next", num);
	}

	public NboardVo prev(int num) {
		return session.selectOne(NAMESPACE + "prev", num);
	}
}
