package com.guem.go.eunbyul;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StatisticsController {
	@Autowired private StatisticsService statservice;
	@RequestMapping(value="/Statistics",method=RequestMethod.GET)
	public ModelAndView statistics() {
		//1.users���̺��� �� ����
		long user=statservice.countusers();
		//2.gosu���̺��� �� ����
		long gosu=statservice.countgosu();
		//1-2�� ��
		long other=user-gosu;
		ModelAndView mv=new ModelAndView(".eunbyul.statistics");
		mv.addObject("user", user);
		mv.addObject("gosu", gosu);
		mv.addObject("other", other);
		return mv;
	}
}
