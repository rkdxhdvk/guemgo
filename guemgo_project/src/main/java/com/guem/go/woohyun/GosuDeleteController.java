package com.guem.go.woohyun;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
/*
	2018-11-07	������ ���� ����
	2018-11-07	���� ��� ����
*/


@Controller
public class GosuDeleteController {
	@Autowired private GosuService service;
	public void setService(GosuService service) {
		this.service = service;
	}
	@RequestMapping("/gosuDelete")
	public ModelAndView delete(String email) {
		int n=service.delete(email);
		ModelAndView mv=new ModelAndView("woohyun/result");
		if(n>0) {
			mv.addObject("code","success");
		}else {
			mv.addObject("code","fail");
		}
		return mv;
	}
}



