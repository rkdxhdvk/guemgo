package com.guem.go.minsu;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class ScheListController {
	@Autowired
	private ScheService sService;
	@Autowired
	private Sche_detailService dService;
	
	@RequestMapping(value="/sche_detailList", method=RequestMethod.GET)
	public String list(int scheduleNum, Model model) {
		List<Sche_detailVo> list=new ArrayList<Sche_detailVo>();
		list = dService.sche_detailList(scheduleNum);
		/*JSONArray arr=new JSONArray();
		for(Sche_detailVo vo:list) {
			JSONObject json=new JSONObject();
			json.put("schedetailNum",vo.getSchedetailNum());
			json.put("lecturename",vo.getLecturename());
			json.put("sDate",vo.getsDate());
			json.put("eDate",vo.geteDate());
			json.put("memo",vo.getMemo());
			json.put("attendance", vo.getAttendance());
			System.out.println(vo.getAttendance());
			arr.put(json);
		}
		return arr.toString();*/
		model.addAttribute("list", list);
		return "minsu/list";
	}
	
	@RequestMapping(value="/scheList", method=RequestMethod.GET)
	public String schelist(String email, Model model) {
		List<ScheduleVo> list=new ArrayList<ScheduleVo>();
		list = sService.schelist(email);
		System.out.println(list.get(1).getLecturename());
		/*JSONArray arr=new JSONArray();
		for(Sche_detailVo vo:list) {
			JSONObject json=new JSONObject();
			json.put("schedetailNum",vo.getSchedetailNum());
			json.put("lecturename",vo.getLecturename());
			json.put("sDate",vo.getsDate());
			json.put("eDate",vo.geteDate());
			json.put("memo",vo.getMemo());
			json.put("attendance", vo.getAttendance());
			System.out.println(vo.getAttendance());
			arr.put(json);
		}*/
		model.addAttribute("list", list);
		return "minsu/schedulelist";
	}
}
