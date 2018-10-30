package com.guem.go.woohyun;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;




@Repository
public class MemberDao {
	@Autowired private SqlSession sqlSession;
	private static final String NAMESPACE="com.guem.go.mybatis.MemberMapper";
	public void setSession(SqlSession session) {
		this.sqlSession = sqlSession;
	}
	
	// ȸ������ DAO
	public int insert(MemberVo vo) {
		return sqlSession.insert(NAMESPACE + ".insert",vo);
	}
	
	// ȸ������Ʈ ��ȸ DAO
	public List<MemberVo> list(){
		return sqlSession.selectList(NAMESPACE + ".list");
	}
	
	// ȸ������ DAO
	public int delete(int mnum) {
		return sqlSession.delete(NAMESPACE + ".delete",mnum);
	}
	
	// ȸ�� ���� ����(1�� ��ȸ) DAO
	public MemberVo detail(int mnum) {
		return sqlSession.selectOne(NAMESPACE +".detail",mnum);
	}
	
	// ȸ�� ���� ����(������Ʈ) DAO
	public int update(MemberVo vo) {
		System.out.println("DAO ������Ʈ �κ�");
		System.out.println(vo.getMnum());
		System.out.println(vo.getName());
		System.out.println(vo.getPwd());
		System.out.println(vo.getMlev());
		System.out.println(vo.getMimg());
		System.out.println(vo.getPoint());
		System.out.println(NAMESPACE + ".update");
		return sqlSession.update(NAMESPACE + ".update",vo); 
	}
	
}
