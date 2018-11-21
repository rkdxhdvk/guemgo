package com.guem.go.minsu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class ScheDeleteController {
	@Autowired
	private Sche_detailService dService;
	@Autowired
	private ScheService sService;
	@RequestMapping(value="/caldelete",produces="application/json;charset=utf-8", method=RequestMethod.GET)
	@ResponseBody
	public String delete(int id) {
		System.out.println(id);
		dService.sche_detailDelete(id);
		return "";
	}
	
	@RequestMapping(value="/alldelete",produces="application/json;charset=utf-8", method=RequestMethod.GET)
	@ResponseBody
	public String allDelete(int scheduleNum) {
		System.out.println(scheduleNum);
		dService.all_detailDelete(scheduleNum);
		sService.schedelete(scheduleNum);
		return "";
	}
}
