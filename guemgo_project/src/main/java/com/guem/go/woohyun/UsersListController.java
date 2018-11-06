package com.guem.go.woohyun;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UsersListController {
	@Autowired private UsersService service;
	public void setService(UsersService service) {
		this.service = service;
	}
	@RequestMapping("/UserList")
	public ModelAndView list() {
		List<UsersVo> list=service.list();
		ModelAndView mv=new ModelAndView("woohyun/userList");
		mv.addObject("list",list);
		return mv;
	}
}












