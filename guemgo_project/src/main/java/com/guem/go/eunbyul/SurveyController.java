package com.guem.go.eunbyul;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class SurveyController {
	@Autowired
	private SurveyDao dao;
	@RequestMapping(value = "/survey", method = RequestMethod.GET)
	public String survey(HttpServletRequest request, Model model){
		String area=request.getParameter("area");
		System.out.println(area);
		//여기서 area랑 카테고리(소)테이블 명칭을 비교해서 해당 명칭의 중넘버를 찾는다
		//중넘버를 찾아서 카테고리 중으로 가고
		
		model.addAttribute("area", area);
        return "eunbyul/survey";
	}

	@RequestMapping(value = "/survey", method = RequestMethod.POST)
	public ModelAndView surveyOk(String s_name, String area,String purpose, String experience, int age, String times, String time, String start, String addr1,String addr2, String anything) {
		System.out.println(s_name);
		System.out.println(purpose);
		System.out.println(experience);
		System.out.println(age);
		System.out.println(times);
		System.out.println(addr1);
		System.out.println(addr2);
		System.out.println(anything);
		System.out.println("11111111111111111111111111");
		
		/*
		SurveyDao dao= new SurveyDao();*/
		CatemVo mvo=dao.selectcatem(s_name);
		System.out.println("카테고리번호:"+mvo.m_num);
		RequireVo vo=new RequireVo(0, "test@test", mvo.m_num, 0 , null);
		int n=dao.insert(vo);
		ModelAndView mv = new ModelAndView();
		 mv.addObject("n", n);
		 mv.setViewName("eunbyul/surveyOk");
		 return mv;
		
	}
}
