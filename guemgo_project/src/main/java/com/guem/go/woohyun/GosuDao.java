package com.guem.go.woohyun;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GosuDao {
	@Autowired private SqlSession sqlSession;
	private static final String NAMESPACE="com.guem.go.mybatis.GosuMapper";
	public void setSession(SqlSession session) {
		this.sqlSession = sqlSession;
	}
	
	// ������� DAO
	public int insert(GosuVo vo) {
		return sqlSession.insert(NAMESPACE + ".insert",vo);
	}
	
	//	??
	public int gosuNum(String email) {
		return sqlSession.selectOne(NAMESPACE + ".gosuNum", email);
	}

	// �������Ʈ ��ȸ DAO
	/*public List<GosuVo> list(){
		return sqlSession.selectList(NAMESPACE + ".list");
	}*/
	
	// ��� ���� DAO
//	public int delete(String email) {
//		return sqlSession.delete(NAMESPACE + ".delete",email);
//	}
	// ��� ���� DAO
	public int update_f(String email) {
		return sqlSession.update(NAMESPACE + ".update_f",email);
	}
	
	// ��� ���� ����(1�� ��ȸ) DAO
	public GosuVo detail(String email) {
		return sqlSession.selectOne(NAMESPACE + ".detail", email); 
	}
	
	// ��� ���� ����(������Ʈ) DAO
	public int update(GosuVo vo) {
		return sqlSession.update(NAMESPACE + ".update", vo);
	}
	
	// ��� ���� ����(������Ʈ) DAO
	public int update_user(GosuVo vo) {
		return sqlSession.update(NAMESPACE + ".update_user", vo);
	}
		
	// ��� ������ ������Ʈ1 DAO
	public int update_profile1(GosuVo vo) {
		return sqlSession.update(NAMESPACE + ".update_profile1", vo);
	}
	
	// ��� ������ ������Ʈ2 DAO
	public int update_profile2(GosuVo vo) {
		return sqlSession.update(NAMESPACE + ".update_profile2", vo);
	}
	
	// ��� ������ ������Ʈ3 DAO
	public int update_profile3(GosuVo vo) {
		return sqlSession.update(NAMESPACE + ".update_profile3", vo);
	}
	
	//����¡ ó�� �� �˻�
		public List<GosuVo> list(Map<String, Object> map) {
			return sqlSession.selectList(NAMESPACE +".list", map);
		}
		public int getCount(Map<String, Object> map) {
			return sqlSession.selectOne(NAMESPACE +".getCount", map);
		}
		
	// ��� ������ ������ ��ȸ(1�� ��ȸ) DAO
		public GosuVo gosuDetail(String email) {
			return sqlSession.selectOne(NAMESPACE + ".gosuDetail", email); 
		}
		
	// ��� ������ ������ ���� ��ȸ
	public  List<GosuVo> gosuDetailLectureList(String email) {
		return sqlSession.selectList(NAMESPACE + ".gosuDetailLectureList", email); 
	}
}
