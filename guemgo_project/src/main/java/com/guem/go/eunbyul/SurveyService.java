package com.guem.go.eunbyul;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SurveyService {
	@Autowired private SurveyDao dao;
	
	public int insert(RequireVo vo) {
		return dao.insert(vo);
	}
	
	public CatemVo selectcatem(String name) {
		return dao.selectcatem(name);
	}
	
	public List<CatesVo> selectcates(String mname){
		return dao.selectcates(mname);
	}
	
	public List<QuestionVo> quelist(){
		return dao.quelist();
	}
	public List<ExampleVo> exlist(){
		return dao.exlist();
	}
	public int ansinsert(AnswerVo vo) {
		return dao.ansinsert(vo);
	}
}
