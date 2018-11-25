package com.guem.go.minsu;

import java.util.HashMap;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guem.go.eunbyul.SurveyService;
import com.guem.go.woohyun.GosuService;


@Controller
public class ScheInsertController {
	@Autowired
	private ScheService scheService;
	@Autowired
	private SurveyService surService;
	@Autowired
	private MatchingService matService;
	@Autowired
	private GosuService goService;
	@RequestMapping(value="/calInsert",produces="application/json;charset=utf-8", method=RequestMethod.GET)
	@ResponseBody
	public String insert(String email, int scheduleNum, String other, int lectureNum, int req_num, String lecturename) {
		System.out.println(email + " " + other + " " + lectureNum + "matchNum" + req_num);
		ScheduleVo vo = new ScheduleVo(scheduleNum, email, other, lectureNum, req_num, lecturename);
		int n = scheService.insert(vo);
		//��û�� ���� ����
		surService.requpdate(req_num);
		//������û�� ���� ����
		HashMap<String, Integer> map = new HashMap<>();
		map.put("lectureNum", lectureNum);
		map.put("req_num", req_num);
		surService.reqlistupdate(map);
		//��Ī���� �߰�
		MatchingVo mvo = new MatchingVo(0, req_num, lectureNum, email, other, null);
		matService.insert(mvo);
		//���Ƚ�� ����
		goService.employUp(other);
		
		JSONObject obj = new JSONObject();
		if(n>0) {
			obj.put("result", "ok");
		}else {
			obj.put("result", "no");
		}
		return obj.toString();
	}
}
