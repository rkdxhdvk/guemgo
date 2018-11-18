package com.guem.go.woohyun;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.guem.go.minsu.PageUtil;
import com.guem.go.minsu.ReviewVo;

@Controller
public class UsersListController {
	@Autowired private UsersService service;
	public void setService(UsersService service) {
		this.service = service;
	}/*
	@RequestMapping("/UserList")
	public ModelAndView list() {
		List<UsersVo> list=service.list();
		ModelAndView mv=new ModelAndView(".userList");
		mv.addObject("list",list);
		return mv;
	}*/
	
	@RequestMapping("/UserList")
	public String list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, String sort, String field,
			String keyword, Model model) {
		Map<String, Object> map = new HashMap<>();
		map.put("field", field);
		map.put("keyword", keyword);
		map.put("sort", sort);

		int totalRowCount = service.getCount(map);
		PageUtil pu = new PageUtil(pageNum, totalRowCount, 10, 5);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<UsersVo> list = service.list(map);

		model.addAttribute("list", list);
		model.addAttribute("pu", pu);
		model.addAttribute("field", field);
		model.addAttribute("keyword", keyword);
		model.addAttribute("sort", sort);
		return ".userList";
	}
}












