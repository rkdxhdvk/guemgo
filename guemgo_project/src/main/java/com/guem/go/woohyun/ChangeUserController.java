package com.guem.go.woohyun;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.guem.go.eunbyul.CatesVo;
import com.guem.go.eunbyul.ClassService;

/*
	2018-11-06	辣快泅 颇老积己
 */
@Controller

public class ChangeUserController {
	@Autowired
	private UsersService service;
	
	@RequestMapping("/changeUser")
	public String mypage(HttpServletRequest request) {
		HttpSession session=request.getSession();
		session.setAttribute("flag", 1);
		return ".main";
	}	
	
}

