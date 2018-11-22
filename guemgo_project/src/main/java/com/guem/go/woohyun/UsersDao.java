package com.guem.go.woohyun;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.guem.go.minsu.ReviewVo;




@Repository
public class UsersDao {
	@Autowired private SqlSession sqlSession;
	private static final String NAMESPACE="com.guem.go.mybatis.UsersMapper";
	public void setSession(SqlSession session) {
		this.sqlSession = sqlSession;
	}
	
	// ȸ������ DAO
	public int insert(UsersVo vo) {
		return sqlSession.insert(NAMESPACE + ".insert",vo);
	}
	
	/*// ȸ������Ʈ ��ȸ DAO
	public List<UsersVo> list(){
		return sqlSession.selectList(NAMESPACE + ".list");
	}*/
	
	// ȸ������ DAO
	public int delete(String email) {
		return sqlSession.delete(NAMESPACE + ".delete",email);
	}
	
	// ȸ�� ���� ����(1�� ��ȸ) DAO
	public UsersVo detail(String email) {
		return sqlSession.selectOne(NAMESPACE +".detail",email);
	}
	
	// ȸ�� ���� ����(������Ʈ) DAO
	public int update(UsersVo vo) {
		//System.out.println("DAO ������Ʈ �κ�");
		return sqlSession.update(NAMESPACE + ".update",vo); 
	}
	
	//ȸ�� ����Ʈ ����
	public int pointUpdate(HashMap<String, Object> map) {
		return sqlSession.update(NAMESPACE + ".pointUpdate", map);
	}
	
	//����¡ ó�� �� �˻�
	public List<UsersVo> list(Map<String, Object> map) {
		return sqlSession.selectList(NAMESPACE +".list", map);
	}
	public int getCount(Map<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE +".getCount", map);
	}
	
	public int cate_insert(UsersVo vo) {
		return sqlSession.insert(NAMESPACE +".cate_insert", vo);
	}
}
