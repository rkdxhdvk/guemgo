package com.guem.go.woohyun;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.guem.go.eunbyul.PayVo;

@Repository
public class PointDao {
	@Autowired private SqlSession sqlSession;
	private static final String NAMESPACE="com.guem.go.mybatis.PointMapper";
	public void setSession(SqlSession session) {
		this.sqlSession = sqlSession;
	}
	
	// ����Ʈ �̷� ��ȸ DAO
	public List<PointVo> list(String email){
		return sqlSession.selectList(NAMESPACE + ".list",email); 
	}
	
	//����Ʈ �̷� �߰� DAO
	public int insert(PointVo vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}
	
	//����Ʈ ����1(users ���̺� point ������Ʈ) DAO
	public int point_update(PointVo vo) {
		return sqlSession.update(NAMESPACE + ".point_update", vo);
	}
	
	//����Ʈ ����2(point ���̺� point �������� ������Ʈ) DAO
	public int point_insert(PointVo vo) {
		return sqlSession.update(NAMESPACE + ".point_insert", vo);
	}
	
	//����Ʈ ����3(pay ���̺� pay ���系�� ������Ʈ) DAO
	public int pay_insert(PointVo vo) {
		return sqlSession.update(NAMESPACE + ".pay_insert", vo);
	}
}
