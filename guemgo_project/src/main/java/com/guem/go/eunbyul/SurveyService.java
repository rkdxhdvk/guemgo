package com.guem.go.eunbyul;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guem.go.woohyun.GosuVo;

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
	
	public List<QuestionVo> quelist(){ //질문list
		return dao.quelist();
	}
	public List<ExampleVo> exlist(){ //보기list
		return dao.exlist();
	}
	public int ansinsert(AnswerVo vo) { //답변insert
		return dao.ansinsert(vo);
	}
	public List<GosuareaVo> gosuarealist(){
		return dao.gosuarealist();
	}
	public LectureVo selectlec(int num){
		return dao.selectlec(num);
	}
	public GosuVo selectgosu(int go_num) {
		return dao.selectgosu(go_num);
	}
}
