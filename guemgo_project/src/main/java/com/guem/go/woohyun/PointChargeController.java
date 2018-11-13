package com.guem.go.woohyun;

import java.text.SimpleDateFormat;
import java.util.Date;

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
	//@Autowired private UsersService service;

	@RequestMapping(value="/pointCharge",method=RequestMethod.GET)
	public  String pointcharge() {
		return "woohyun/pointCharge";
	}
	
	
}











