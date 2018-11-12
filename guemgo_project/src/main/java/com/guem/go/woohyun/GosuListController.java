package com.guem.go.woohyun;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/*
	018-11-05	윤우현 파일 생성
*/	
@Controller
public class GosuListController {
	@Autowired private GosuService service;
	public void setService(GosuService service) {
		this.service = service;
	}
	
	@RequestMapping("/GosuList")
	public ModelAndView list() {
		List<GosuVo> list=service.list();
		ModelAndView mv=new ModelAndView("woohyun/gosuList");
		mv.addObject("list",list);
		return mv;
	}
	
}
