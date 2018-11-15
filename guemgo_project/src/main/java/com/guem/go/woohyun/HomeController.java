package com.guem.go.woohyun;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.guem.go.eunbyul.CateService;
import com.guem.go.eunbyul.CatesVo;


/*
	2018-10-24	윤우현 파일생성-홈디렉토리 변경
 */
@Controller

public class HomeController {
/*	@ModelAttribute("header")
	public List<String> header(){
		List<String> list=new ArrayList<String>();
		list.add("의류");
		list.add("신발");
		list.add("화장품");
		return list;
	}*/
	@Autowired
	private CateService cateservice;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {	
		
		List<CatesVo> list=cateservice.cateslist();
		ModelAndView mv=new ModelAndView(".main");
		mv.addObject("list", list);
		return mv;
	}
	
}
