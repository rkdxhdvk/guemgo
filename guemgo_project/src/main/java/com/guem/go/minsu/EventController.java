package com.guem.go.minsu;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guem.go.woohyun.PointService;
import com.guem.go.woohyun.PointVo;
import com.guem.go.woohyun.UsersService;
import com.guem.go.woohyun.UsersVo;


@Controller
public class EventController {
	@Autowired
	private EventService service;
	@Autowired
	private PointService pService;
	@Autowired
	private UsersService uService;
	
	@RequestMapping(value="/point")
	public String event() {
		return ".pointRecord";
	}
	@RequestMapping(value="/eventinsert", produces="application/json;charset=utf-8", method=RequestMethod.GET)
	@ResponseBody
	public int insert(String att, String email) {
		EventVo vo = new EventVo(att, email);
		service.insert(vo);
		HashMap<String, Object> map = new HashMap<>();
		map.put("email", email);
		map.put("point", 5);
		uService.userpoint(map);
		UsersVo uvo = uService.detail(email);
		PointVo pvo = new PointVo(0, email, null, 1, "출석 이벤트 충전", 5, uvo.getPoint()+5);
		pService.insert(pvo);
		return 1;
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
		
		return ".event";
	}
	
}
