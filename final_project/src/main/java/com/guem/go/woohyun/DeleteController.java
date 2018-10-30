package com.guem.go.woohyun;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
/*
	2018-10-29	윤우현 파일 생성
	2018-10-30	삭제 기능 구현
*/


@Controller
public class DeleteController {
	@Autowired private MemberService service;
	public void setService(MemberService service) {
		this.service = service;
	}
	@RequestMapping("/MemberDelete")
	public ModelAndView delete(int mnum) {
		int n=service.delete(mnum);
		ModelAndView mv=new ModelAndView("woohyun/result");
		if(n>0) {
			mv.addObject("code","success");
		}else {
			mv.addObject("code","fail");
		}
		return mv;
	}
}



