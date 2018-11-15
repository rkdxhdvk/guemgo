package com.guem.go.minsu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class Sche_detailInsertController {
	@Autowired
	private Sche_detailService sche_detailServie;
	
	@RequestMapping(value="/cal",produces="application/json;charset=utf-8", method=RequestMethod.GET)
	@ResponseBody
	public String sche(int scheduleNum, int id, String lecturename, String memo, String start, String end) {
		System.out.println("insertController" + lecturename + memo + start + end);
		Sche_detailVo vo = new Sche_detailVo(id, scheduleNum, memo, start, end, 0, lecturename);
		int n = sche_detailServie.insert(vo);
		return "";
	}
}