package com.guem.go.minsu;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class ScheInsertController {
	@Autowired
	private ScheService scheService;
	
	@RequestMapping(value="/calInsert",produces="application/json;charset=utf-8", method=RequestMethod.GET)
	@ResponseBody
	public String insert(String email, String other, int lectureNum, int matchNum, String lecturename) {
		System.out.println(email + " " + other + " " + lectureNum);
		ScheduleVo vo = new ScheduleVo(0, email, other, lectureNum, matchNum, lecturename);
		scheService.insert(vo);
		int scheduleNum = scheService.scheduleNum();
		JSONObject obj = new JSONObject();
		obj.put("scheduleNum", scheduleNum);
		System.out.println(scheduleNum);
		return obj.toString();
	}
}
