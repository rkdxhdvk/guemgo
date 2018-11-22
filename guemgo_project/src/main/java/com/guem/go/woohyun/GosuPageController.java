package com.guem.go.woohyun;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

/*
	2018-11-12	윤우현 파일 생성
*/
	
@Controller
@SessionAttributes("vo") //ModelAttribute에 담긴 vo를 SessionAttributes에 담기
public class GosuPageController {
	@Autowired private GosuService gosuService;
/*	
	@ModelAttribute("vo")
	public MemberVo email(String email) {
		MemberVo vo=service.detail(email);
		return vo;
	}
*/	
	@RequestMapping("/gosuPage")
	public ModelAndView mypage(String email) {
		GosuVo vo=gosuService.gosuDetail(email);
		// lecturelist 를 하나 더 받아옴
		List<GosuVo> lectureList = gosuService.gosuDetailLectureList(email);
		
		ModelAndView mv=new ModelAndView(".gosuPage");
		mv.addObject("vo",vo);
		mv.addObject("lectureList",lectureList); 
		
		return mv;
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











