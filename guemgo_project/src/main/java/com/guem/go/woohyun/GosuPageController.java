package com.guem.go.woohyun;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

/*
	2018-11-12	������ ���� ����
*/
	
@Controller
@SessionAttributes("vo") //ModelAttribute�� ��� vo�� SessionAttributes�� ���
public class GosuPageController {
	@Autowired private UsersService service;
/*	
	@ModelAttribute("vo")
	public MemberVo email(String email) {
		MemberVo vo=service.detail(email);
		return vo;
	}
*/	
	@RequestMapping("/gosupage")
	public String mypage() {
		return "woohyun/gosuPage";
	}	
	
/*
	@RequestMapping(value="/update",method=RequestMethod.GET)
	public String update() {
		return "update";
	}
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String updateOk(MemberVo vo,SessionStatus st) {
		service.update(vo);
		st.setComplete();//SessionAttributes�� ��� vo��ü �����
		return "redirect:/";
	}
*/
}











