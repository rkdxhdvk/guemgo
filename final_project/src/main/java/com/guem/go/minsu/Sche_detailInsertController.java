package com.guem.go.minsu;

import org.json.JSONObject;
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
	public String sche(int scheduleNum, String title, String memo, String start, String end) {
		JSONObject obj=new JSONObject();
		System.out.println(title + memo + start + end);
		Sche_detailVo vo = new Sche_detailVo(0, scheduleNum, memo, start, end, 0);
		sche_detailServie.insert(vo);
		int sche_detailNum = sche_detailServie.sche_detailNum();
		
		obj.put("sche_detailNum", sche_detailNum);
		System.out.println(obj.toString());
		return obj.toString();
	}
}