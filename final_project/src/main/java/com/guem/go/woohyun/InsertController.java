package com.guem.go.woohyun;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
/*
	2018-10-29	윤우현 파일 생성
*/

@Controller
public class InsertController {
	@Autowired private MemberService service;
	
	@RequestMapping(value="/insert",method=RequestMethod.GET)
	public String insert() {
		return "woohyun/insert";
	}
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public ModelAndView insertOk(MemberVo vo) {
		vo.setDiv(1);	// 회원가입시 사용자 구분:일반(0-관리자,1-일반회원,2-고수)
		vo.setMlev(0);	// 회원가입시 기본 회원등급
		vo.setMimg("0");	// 회원가입시 기본 이미지
		vo.setPoint(50);	// 회원가입시 기본 포인트
		int n=service.insert(vo);
		ModelAndView mv=new ModelAndView("woohyun/result");
		if(n>0) {
			mv.addObject("code","success");
		}else {
			mv.addObject("code","fail");
		}
		return mv;
	}
}
