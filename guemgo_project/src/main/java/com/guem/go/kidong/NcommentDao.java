package com.guem.go.kidong;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NcommentDao {
	@Autowired
	private SqlSession session;

	private final static String NAMESPACE = "com.guem.go.mybatis.NcommentMapper.";

	public int getMaxNum(int num) {
		return session.selectOne(NAMESPACE + "getMaxNum", num);
	}

	public int getCount(int num) {
		return session.selectOne(NAMESPACE + "getCount", num);
	}

	public int insert(NcommentVo vo) {
		return session.insert(NAMESPACE + "insert", vo);
	}

	public int insertReply(Map<String, Object> map) {
		return session.insert(NAMESPACE + "insertReply", map);
	}

	public List<NcommentVo> list(int num) {
		return session.selectList(NAMESPACE + "list", num);
	}

	public int update(NcommentVo vo) {
		return session.update(NAMESPACE + "update", vo);
	}

	public int delete(int cnum) {
		return session.delete(NAMESPACE + "delete", cnum);
	}

	public int deleteRef(int ref) {
		return session.delete(NAMESPACE + "deleteGrp", ref);
	}
}
