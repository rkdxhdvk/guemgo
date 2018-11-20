package com.guem.go.woohyun;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GosuProfileDetailController {
	@Autowired private GosuService gosuService;
	
	@RequestMapping("/gosuProfileDetail")
	public ModelAndView gosuProfileDeatail(String email) {
		GosuVo vo=gosuService.gosuDetail(email);
		// lecturelist 를 하나 더 받아옴
		List<GosuVo> lectureList = gosuService.gosuDetailLectureList(email);
		
		ModelAndView mv=new ModelAndView("/woohyun/gosuProfileDetail");
		mv.addObject("vo",vo);
		mv.addObject("lectureList",lectureList); 
		
		return mv;
	}
}
