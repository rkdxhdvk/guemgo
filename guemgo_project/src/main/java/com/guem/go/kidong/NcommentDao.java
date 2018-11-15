package com.guem.go.kidong;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NcommentDao {
	@Autowired
	private SqlSession session;

	private final static String NAMESPACE = "com.guem.go.mybatis.NcommentMapper.";

	public int getCount(int num) {
		return session.selectOne(NAMESPACE + "getCount", num);
	}

	public int insert(NcommentVo vo) {
		return session.insert(NAMESPACE + "insert", vo);
	}

	public int insertReply(NreplyVo vo) {
		return session.insert(NAMESPACE + "insertReply", vo);
	}
	
	public List<NreplyVo> replys(int cnum) {
		return session.selectList(NAMESPACE + "replys", cnum);
	}
	
	public CommentsVo getInfo(int num) {
		return session.selectOne(NAMESPACE + "getInfo", num);
	}
	
	public List<CommentsVo> list(int num) {
		return session.selectList(NAMESPACE + "list", num);
	}

	public int update(NcommentVo vo) {
		return session.update(NAMESPACE + "update", vo);
	}

	public int delete(int cnum) {
		return session.delete(NAMESPACE + "delete", cnum);
	}
	
	public int deleteReply(int num) {
		return session.delete(NAMESPACE + "deleteReply", num);
	}
}
