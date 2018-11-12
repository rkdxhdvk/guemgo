package com.guem.go.woohyun;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
/*
	2018-11-07	윤우현 파일 생성
*/
@Controller
public class GosuUpdateController {
	@Autowired private GosuService service;
	
	//request로 전달된 데이터를 파라미터 변수에 담기전에 수행됨
	//(String 타입을 Date타입으로 변환하기)
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		CustomDateEditor dateEditor=
				new CustomDateEditor(new SimpleDateFormat("yyyy/MM/dd"),true);
		binder.registerCustomEditor(Date.class, dateEditor);
	}
	
	public void setService(GosuService service) {
		this.service = service;
	}
	@RequestMapping(value="/GosuUpdate",method=RequestMethod.GET)
	public ModelAndView updateForm(String email) {
		GosuVo vo=service.detail(email);
		ModelAndView mv=new ModelAndView("woohyun/gosuUpdate");
		mv.addObject("vo",vo);
//		System.out.println("업데이트콘트롤러GET 완료");
		return mv;
	}
	
	@RequestMapping(value="/GosuUpdate",method=RequestMethod.POST)
	@Transactional
	public ModelAndView update(GosuVo vo) {
		int n=service.update(vo);
		int j=service.update_user(vo);
		//System.out.println(vo.getMnum);

		ModelAndView mv=new ModelAndView("woohyun/result");
		if(n>0 && j>0) {
			mv.addObject("code","success");
//			System.out.println("업데이트콘트롤러POST-성공");
		}else {
			mv.addObject("code","fail");
//			System.out.println("업데이트콘트롤러POST-실패");
		}
//		System.out.println("업데이트콘트롤러POST-완료");
		return mv;
	}
}











