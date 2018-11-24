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
		//1.usersÅ×ÀÌºíÀÇ ÃÑ °¹¼ö
		long user=statservice.countusers();
		//2.gosuÅ×ÀÌºíÀÇ ÃÑ °¹¼ö
		long gosu=statservice.countgosu();
		//1-2ÀÇ ¼ö
		long other=user-gosu;
		ModelAndView mv=new ModelAndView(".eunbyul.statistics");
		mv.addObject("user", user);
		mv.addObject("gosu", gosu);
		mv.addObject("other", other);
		return mv;
	}
}
