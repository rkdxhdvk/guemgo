package com.guem.go.minsu;

import java.util.HashMap;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guem.go.eunbyul.SurveyService;


@Controller
public class ScheInsertController {
	@Autowired
	private ScheService scheService;
	@Autowired
	private SurveyService surService;
	@Autowired
	private MatchingService matService;
	
	@RequestMapping(value="/calInsert",produces="application/json;charset=utf-8", method=RequestMethod.GET)
	@ResponseBody
	public String insert(String email, int scheduleNum, String other, int lectureNum, int matchNum, String lecturename) {
		System.out.println(email + " " + other + " " + lectureNum);
		ScheduleVo vo = new ScheduleVo(scheduleNum, email, other, lectureNum, matchNum, lecturename);
		int n = scheService.insert(vo);
		//요청서 상태 변경
		surService.requpdate(matchNum);
		//받은요청서 상태 변경
		HashMap<String, Integer> map = new HashMap<>();
		map.put("lectureNum", lectureNum);
		map.put("req_num", matchNum);
		surService.reqlistupdate(map);
		//매칭성공 추가
		MatchingVo mvo = new MatchingVo(0, matchNum, lectureNum, email, other, null);
		matService.insert(mvo);
		
		JSONObject obj = new JSONObject();
		if(n>0) {
			obj.put("result", "ok");
		}else {
			obj.put("result", "no");
		}
		return obj.toString();
	}
}
