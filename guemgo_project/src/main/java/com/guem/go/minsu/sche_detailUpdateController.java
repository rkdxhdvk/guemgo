package com.guem.go.minsu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class sche_detailUpdateController {
	@Autowired
	private Sche_detailService service;
	
	@RequestMapping(value="/calupdate",produces="application/json;charset=utf-8", method=RequestMethod.GET)
	@ResponseBody
	public String update(int id, String start, String end, String description) {
		Sche_detailVo cvo = service.sche_detail(id);
		System.out.println(start + " " + end + " " + id);
		Sche_detailVo uvo = new Sche_detailVo
				(id, cvo.getScheduleNum(), description, start, end, cvo.getAttendance(), cvo.getLecturename());
		System.out.println(cvo.getNum() + " " + cvo.getLecturename());
		System.out.println(cvo.getScheduleNum() + " " + cvo.getMemo());
		service.update(uvo);
		return "";
	}
	@RequestMapping(value="/attupdate",produces="application/json;charset=utf-8", method=RequestMethod.GET)
	@ResponseBody
	public String attendance(int id) {
		Sche_detailVo cvo = service.sche_detail(id);
		Sche_detailVo uvo = new Sche_detailVo
				(id, cvo.getScheduleNum(), cvo.getMemo(), cvo.getsDate(), cvo.geteDate(), 1, cvo.getLecturename());
		System.out.println(cvo.getNum() + " " + cvo.getLecturename());
		System.out.println(cvo.getScheduleNum() + " " + cvo.getMemo());
		service.update(uvo);
		return "";
	}
	
	
	
}
