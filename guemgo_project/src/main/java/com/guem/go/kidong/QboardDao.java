package com.guem.go.kidong;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QboardDao {
	@Autowired
	private SqlSession session;
	
	private final static String NAMESPACE = "com.guem.go.mybatis.QnaMapper.";
	
	public int getMaxNum() {
		return session.selectOne(NAMESPACE + "getMaxNum");
	}
	
	public int getCount(Map<String, Object> map) {
		return session.selectOne(NAMESPACE + "getCount", map);
	}
	
	public int insert(QboardVo qboardVo) {
		return session.insert(NAMESPACE + "insert", qboardVo);
	}
	
	public int insertReply(Map<String, Object> map) {
		return session.insert(NAMESPACE + "insertReply", map);
	}
	
	public List<QboardVo> list(Map<String, Object> map){
		return session.selectList(NAMESPACE + "list", map);
	}
	
	public QboardVo detail(int qna_num) {
		return session.selectOne(NAMESPACE + "detail", qna_num);
	}
	
	public int update(QboardVo qboardVo) {
		return session.update(NAMESPACE + "update", qboardVo);
	}
	
	public int addHit(int qna_num) {
		return session.update(NAMESPACE + "addHit", qna_num);
	}
	
	public int delete(int qna_num) {
		return session.delete(NAMESPACE + "delete", qna_num);
	}
	
	public int deleteGrp(int grp) {
		return session.delete(NAMESPACE + "deleteGrp", grp);
	}
	
	public int addFlag(int grp) {
		return session.update(NAMESPACE + "addFlag", grp);
	}
	
	public List<QboardVo> select(int grp){
		return session.selectList(NAMESPACE + "select", grp);
	}
}














