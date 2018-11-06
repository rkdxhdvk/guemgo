package com.guem.go.woohyun;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/*
---------------------------------------------
	2018-11-02	辣快泅 颇老 积己
---------------------------------------------
*/
@Controller
public class GosuInsertController {
	@Autowired private GosuService gosuService;
	@Autowired private CateService cateService;
	
	@RequestMapping(value="/GosuInsertForm",method=RequestMethod.GET)
	public ModelAndView insertForm() {
		ModelAndView mv=new ModelAndView("woohyun/gosuInsert");
		List<CateVo> list=cateService.cate_l_list();
		mv.addObject("cate_l",list);
		return mv;
	}
	
	@RequestMapping(value="/GosuInsert")
	public ModelAndView insert(GosuVo vo, HttpServletRequest request) {
		HttpSession session=request.getSession();
		vo.setEmail((String)session.getAttribute("email"));
		vo.setGrade("0");
		vo.setEmploy(0);
		int n=gosuService.insert(vo);
		ModelAndView mv=new ModelAndView("woohyun/result");
		if(n>0) {
			mv.addObject("code","success");
		}else {
			mv.addObject("code","fail");
		}
		return mv;
	}
	
}
