package com.guem.go.woohyun;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
/*
	2018-11-07	윤우현 파일 생성
	2018-11-07	삭제 기능 구현
*/


@Controller
public class GosuDeleteController {
	@Autowired private GosuService service;
	public void setService(GosuService service) {
		this.service = service;
	}
	@RequestMapping("/GosuDelete")
	public ModelAndView delete(String email) {
//		int n=service.delete(email);
		int n=service.update_f(email);
		ModelAndView mv=new ModelAndView("woohyun/result");
		if(n>0) {
			mv.addObject("code","gosuDelete_success");
		}else {
			mv.addObject("code","gosuDelete_fail");
		}
		mv.addObject("goUrl","/");
		return mv;
	}
}



