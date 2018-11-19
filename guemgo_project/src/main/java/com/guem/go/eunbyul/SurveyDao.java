package com.guem.go.eunbyul;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.w3c.dom.ls.LSInput;

import com.guem.go.woohyun.GosuVo;

@Repository
public class SurveyDao {
	@Autowired
	private SqlSession sqlSession;
	private final static String NAMESPACE="com.guem.go.mybatis.SurveyMapper";
	
	public int insert(RequireVo vo) {
		
		return sqlSession.insert(NAMESPACE+".requireInsert",vo);
		
	}
	
	public CatemVo selectcatem(String name) {
		return sqlSession.selectOne(NAMESPACE+".selectcatem",name);
	}
	
	public List<CatesVo> selectcates(String mname) {
		return sqlSession.selectList(NAMESPACE+".selectcates",mname);
	}

	public List<QuestionVo> quelist() {
		return sqlSession.selectList(NAMESPACE + ".quelist");
	}
	public List<ExampleVo> exlist() {
		return sqlSession.selectList(NAMESPACE + ".exlist");
	}

	public int ansinsert(AnswerVo vo) {
		return sqlSession.insert(NAMESPACE + ".ansinsert", vo);
	}


	public List<GosuareaVo> gosuarealist() {
		return sqlSession.selectList(NAMESPACE + ".gosuarealist");
	}

	public LectureVo selectlec(int lectureNum) {
		return sqlSession.selectOne(NAMESPACE + ".selectlec" ,lectureNum);
	}
	
	public GosuVo selectgosu(int go_num) {
		return sqlSession.selectOne(NAMESPACE + ".selectgosu", go_num);
	}
	
	public int requestinsert(HashMap<String, Object> map) {
		return sqlSession.insert(NAMESPACE+".requestinsert",map);
	}

	public List<RequirelistVo> requestlist(String email) {
		return sqlSession.selectList(NAMESPACE+".requestlist",email);
	}

	public RequireVo requireselect(int num) {
		return sqlSession.selectOne(NAMESPACE + ".requireselect", num);
	}

	public LectureVo lectureselect(String lecturename) {
		return sqlSession.selectOne(NAMESPACE + ".lectureselect", lecturename);
	}
	
	public List<RequireVo> requirelist(String email){
		return sqlSession.selectList(NAMESPACE+".requirelist",email);
	}

	public List<AnswerVo> answer(int num) {
		return sqlSession.selectList(NAMESPACE+".answer",num);
	}
}
