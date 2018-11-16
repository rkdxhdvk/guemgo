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
		
		model.addAttribute("list", list);
		
		return "minsu/list";
	}
	
	@RequestMapping(value="/scheList", method=RequestMethod.GET)
	public String schelist(String email, Model model) {
		List<ScheduleVo> list=new ArrayList<ScheduleVo>();
		list = sService.schelist(email);
		model.addAttribute("list", list);
		return ".schedulelist";
	}
}
