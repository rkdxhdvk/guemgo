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

	//강의 테이블에 insert
	public int classinsert(LectureVo vo) {
		return sqlSession.insert(NAMESPACE + ".classinsert",vo);
	}
	public int areainsert(GosuareaVo vo) {
		return sqlSession.insert(NAMESPACE + ".areainsert",vo);
	}
	
	//강의목록 list
	public List<LectureVo> classlist(int go_num) {
		return sqlSession.selectList(NAMESPACE + ".classlist" , go_num);
	}
	
	public GosuVo gosuselect(String email) {
		return sqlSession.selectOne(NAMESPACE+".gosuselect", email);
	}

	public LectureVo classSelect(int lecturenum) {
		return sqlSession.selectOne(NAMESPACE + ".classSelect", lecturenum);
	}
}
