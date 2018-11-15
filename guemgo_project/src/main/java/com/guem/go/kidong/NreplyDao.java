package com.guem.go.kidong;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class NreplyDao {
	@Autowired
	private SqlSession session;

	private final static String NAMESPACE = "com.guem.go.mybatis.NreplyMapper.";

	public int getCount(int cnum) {
		return session.selectOne(NAMESPACE + "getCount", cnum);
	}

	public int insert(NreplyVo vo) {
		return session.insert(NAMESPACE + "insert", vo);
	}

	public List<NreplyVo> list(int cnum) {
		return session.selectList(NAMESPACE + "list", cnum);
	}

	public int update(NreplyVo vo) {
		return session.update(NAMESPACE + "update", vo);
	}

	public int delete(int num) {
		return session.delete(NAMESPACE + "delete", num);
	}
}
