package com.guem.go.woohyun;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
/*
-------------------------------
	2018-11-13	辣快泅 颇老 积己
-------------------------------
*/
@Controller
public class PointChargeController {
	@Autowired private UsersService userService;

	@RequestMapping(value="/pointCharge",method=RequestMethod.GET)
	public  ModelAndView pointcharge(HttpSession session, HttpServletResponse response) {
		String email = (String)session.getAttribute("email");
		
		if (email == null) {
			return new ModelAndView("redirect:/");
		}
		
		ModelAndView mv = new ModelAndView("woohyun/pointCharge");
		
		UsersVo vo = userService.detail(email);
		mv.addObject("vo", vo);
		
		return mv;
	}
	
	
}











