package com.guem.go.woohyun;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

/*
 * --------------------------
	2018-11-13	辣快泅 颇老 积己
 * --------------------------
*/	
@Controller
public class PointRecordController {
	@Autowired private PointService service;
	public void setService(PointService service) {
		this.service = service;
	}
	
	@RequestMapping(value="/pointRecord",method=RequestMethod.GET)
	public ModelAndView list(String email) {
		List<PointVo> list=service.list(email);
		ModelAndView mv=new ModelAndView(".pointRecord");
		mv.addObject("list",list);
		return mv;
	}
/*	
	@RequestMapping(value="/pointRecord",method=RequestMethod.POST)
	public ModelAndView list() {
		List<PointVo> list=service.list();
		ModelAndView mv=new ModelAndView("woohyun/pointRecord");
		mv.addObject("list",list);
		return mv;
	}
	*/
}
