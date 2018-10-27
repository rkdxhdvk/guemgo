package com.guem.go.woohyun;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InsertController {
	@Autowired private MemberService service;
	
	@RequestMapping(value="/insert",method=RequestMethod.GET)
	public String insert() {
		return "woohyun/insert";
	}
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public ModelAndView insertOk(MemberVo vo) {
		int n=service.insert(vo);
		ModelAndView mv=new ModelAndView("result");
		if(n>0) {
			mv.addObject("code","success");
		}else {
			mv.addObject("code","fail");
		}
		return mv;
	}
}
