package com.guem.go.woohyun;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;


@Controller
@SessionAttributes("vo") //ModelAttribute에 담긴 vo를 SessionAttributes에 담기
public class AdminPageController {
	@Autowired private MemberService service;
	
/*	@ModelAttribute("vo")
	public MemberVo email(String email) {
		MemberVo vo=service.detail(email);
		return vo;
	}*/
	@RequestMapping("/admin")
	public String mypage() {
		return "woohyun/admin";
	}	
/*	
	@RequestMapping(value="/update",method=RequestMethod.GET)
	public String update() {
		return "update";
	}
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String updateOk(MemberVo vo,SessionStatus st) {
		service.update(vo);
		st.setComplete();//SessionAttributes에 담긴 vo객체 지우기
		return "redirect:/";
	}
*/
}











