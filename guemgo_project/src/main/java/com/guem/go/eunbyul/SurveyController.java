package com.guem.go.eunbyul;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class SurveyController {
	@RequestMapping(value = "/survey", method = RequestMethod.GET)
	public String survey(HttpServletRequest request, Model model){
		String area=request.getParameter("area");
		System.out.println(area);
		//여기서 area랑 카테고리(소)테이블 명칭을 비교해서 해당 명칭의 중넘버를 찾는다
		//중넘버를 찾아서 카테고리 중으로 가고
		
		model.addAttribute("area", area);
        return "eunbyul/survey";
	}

	@RequestMapping(value = "/surveyOk", method = RequestMethod.POST)
	public String surveyOk() {
		return "eunbyul/surveyOk";
	}
}
