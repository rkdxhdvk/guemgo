package com.guem.go.eunbyul;

import java.util.List;

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
}
