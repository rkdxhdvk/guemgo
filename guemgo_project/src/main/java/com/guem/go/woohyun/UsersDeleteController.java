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
public class UsersDeleteController {
	@Autowired private UsersService service;
	public void setService(UsersService service) {
		this.service = service;
	}
	@RequestMapping("/UserDelete")
	public ModelAndView delete(String email) {
//		int n=service.delete(email);	// 실제 삭제하지 않음
		int n=service.update_f(email);
		ModelAndView mv=new ModelAndView("woohyun/result");
		if(n>0) {
			mv.addObject("code","userDelete_success");
		}else {
			mv.addObject("code","userDelete_fail");
		}
		mv.addObject("goUrl","/");
		return mv;
	}
}



