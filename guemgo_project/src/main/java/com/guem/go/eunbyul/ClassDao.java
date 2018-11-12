package com.guem.go.eunbyul;



import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.guem.go.woohyun.GosuVo;

@Repository
public class ClassDao {
	@Autowired
	private SqlSession sqlSession;
	
	private final static String NAMESPACE="com.guem.go.mybatis.ClassMapper";


	//���� ���̺� insert
	public int classinsert(LectureVo vo) {
		return sqlSession.insert(NAMESPACE + ".classinsert",vo);
	}
	public int areainsert(GosuareaVo vo) {
		return sqlSession.insert(NAMESPACE + ".areainsert",vo);
	}
	
	//���Ǹ�� list
	public List<LectureVo> classlist(int gonum) {
		return sqlSession.selectList(NAMESPACE + ".classlist" , gonum);
	}
	public List<CatemVo> catemlist() {
		return sqlSession.selectList(NAMESPACE + ".catemlist");
	}
	public List<CatesVo> selectcates(String mname) {
		return sqlSession.selectList(NAMESPACE+".selectcates",mname);
	}
	public List<CatesVo> cateslist() {
		return sqlSession.selectList(NAMESPACE+".cateslist");
	}
	public GosuVo gosuselect(String email) {
		return sqlSession.selectOne(NAMESPACE+".gosuselect", email);
	}
	
}
