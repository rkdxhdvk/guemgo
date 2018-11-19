package com.guem.go.eunbyul;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SurveyListController {
	@Autowired
	private SurveyService surveyservice;
	@RequestMapping(value="/receiveList",method=RequestMethod.GET)
	public ModelAndView receiveList(String email) {
		ModelAndView mv=new ModelAndView(".eunbyul.receivelist");
		
	
		//이메일로 받은요청내역받아오기
		List<RequirelistVo> list=surveyservice.requestlist(email);
		
		mv.addObject("email", email);
		mv.addObject("list", list);
		return mv;
		
	}
	@RequestMapping(value="/receivedetail",method=RequestMethod.GET)
	public ModelAndView receivedetail(int num, String email,String lecturename) {
		//내꺼 상대방 강의번호
		
		ModelAndView mv=new ModelAndView(".eunbyul.receivedetail");
		//요청서번호로 이메일찾아오기
		RequireVo vo=surveyservice.requireselect(num);
		//강의명으로 강의번호찾아오기
		LectureVo vo2=surveyservice.lectureselect(lecturename);
		mv.addObject("lecturenum", vo2.getLectureNum());
		mv.addObject("other", vo.getEmail());
		mv.addObject("email", email);
		return mv;
	}
	@RequestMapping(value="/sendlist", method=RequestMethod.GET)
	public ModelAndView sendList(String email) {
		ModelAndView mv= new ModelAndView(".eunbyul.sendlist");
		//본인 이메일로 요청서 테이블에서 요청서번호 가져와서 답변테이블에서 답변들 찾아서 보여주기
		List<RequireVo> list=surveyservice.requirelist(email);//이메일로 요청서가져오기
/*		ArrayList<List<AnswerVo>> list3=new ArrayList<List<AnswerVo>>();
		for(int i=0; i<list.size(); i++) {
			List<AnswerVo> list2 =surveyservice.answer(list.get(i).getReq_num()); //요청서넘버를 가져와서 답변들을 가져옴
			list3.add(list2);
		}*/
		mv.addObject("email", email);
		mv.addObject("list", list);
		return mv;
	}
	@RequestMapping(value="/senddetail",method=RequestMethod.GET)
	public ModelAndView sendDetail(int num) {
		List<QuestionVo> quelist=surveyservice.quelist();
		ModelAndView mv= new ModelAndView(".eunbyul.senddetail");
		List<AnswerVo> list=surveyservice.answer(num);
		mv.addObject("quelist", quelist);
		mv.addObject("list", list);
		return mv;
	}
}
