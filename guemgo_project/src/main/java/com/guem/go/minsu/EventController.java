package com.guem.go.minsu;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
public class EventController {
	@Autowired
	private EventService service;
	
	@RequestMapping(value="/event")
	public String event() {
		return "minsu/attCheck";
	}
	@RequestMapping(value="/eventinsert", produces="application/json;charset=utf-8", method=RequestMethod.GET)
	@ResponseBody
	public int insert(String att, String email) {
		EventVo vo = new EventVo(email, att);
		return service.insert(vo);
	}
	@RequestMapping(value="/eventlist", method=RequestMethod.GET)
	public String list(String email, Model model) {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String currDate = sdf.format(cal.getTime());
		System.out.println(currDate);
		List<EventVo> list = new ArrayList<EventVo>();
		list = service.list(email);
		model.addAttribute("list", list);
		model.addAttribute("date", currDate);
		
		return "minsu/attCheck";
	}
}
