package com.guem.go.woohyun;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberListController {
	@Autowired private MemberService service;
	public void setService(MemberService service) {
		this.service = service;
	}
	@RequestMapping("/MemberList")
	public ModelAndView list() {
		List<MemberVo> list=service.list();
		ModelAndView mv=new ModelAndView("woohyun/list");
		mv.addObject("list",list);
		return mv;
	}
}












