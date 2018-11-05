package com.guem.go.eunbyul;



import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClassDao {
	@Autowired
	private SqlSession sqlSession;
	
	private final static String NAMESPACE="com.guem.go.mybatis.ClassMapper";


	//���� ���̺� insert
	public int classinsert(LectureVo vo) {
		return sqlSession.insert(NAMESPACE + ".insert",vo);
	}
	
	//���Ǹ�� list
	public List<LectureVo> classlist(int gonum) {
		return sqlSession.selectList(NAMESPACE + ".list" , gonum);
	}
}
