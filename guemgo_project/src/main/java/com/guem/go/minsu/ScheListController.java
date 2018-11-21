package com.guem.go.minsu;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tiles.request.Request;
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
	
	@RequestMapping(value="/user/scheList", method=RequestMethod.GET)
	public String userschelist(String email, Model model, HttpServletRequest request) {
		List<ScheduleVo> list=new ArrayList<ScheduleVo>();
		HttpSession session = request.getSession();
		int flag = (int)session.getAttribute("flag");
		System.out.println(flag);
		if(flag==2) {
			list = sService.schelist(email);
			model.addAttribute("list", list);
		}
		if(flag==1) {
			list = sService.userschelist(email);
			model.addAttribute("list", list);
		}
		return ".userschedulelist";
	}
	
	@RequestMapping(value="/gosu/scheList", method=RequestMethod.GET)
	public String gosuschelist(String email, Model model, HttpServletRequest request) {
		List<ScheduleVo> list=new ArrayList<ScheduleVo>();
		HttpSession session = request.getSession();
		int flag = (int)session.getAttribute("flag");
		System.out.println(flag);
		if(flag==2) {
			list = sService.schelist(email);
			model.addAttribute("list", list);
		}
		if(flag==1) {
			list = sService.userschelist(email);
			model.addAttribute("list", list);
		}
		return ".gosuschedulelist";
	}
	
	@RequestMapping(value="/scheList", method=RequestMethod.GET)
	public String schelist(String email, Model model, HttpServletRequest request) {
		List<ScheduleVo> schelist = sService.schelist(email);
		/*ArrayList<List<Sche_detailVo>> dlist = new ArrayList<>();
		for(ScheduleVo svo : schelist) {
			List<Sche_detailVo> detaillist = dService.sche_detailList(svo.getScheduleNum());
			dlist.add(detaillist);
		}*/
		model.addAttribute("schelist", schelist);
		return "minsu/list2";
	}
	
	@RequestMapping(value="/detaillist", produces="application/json;charset=utf-8", method=RequestMethod.GET)
	@ResponseBody
	public String detail(int scheduleNum, Model model) {
		List<Sche_detailVo> list = dService.sche_detailList(scheduleNum);
		model.addAttribute("detaillist", list);
		org.json.JSONArray arr=new org.json.JSONArray();
		for(Sche_detailVo vo : list) {
			JSONObject json=new JSONObject();
			json.put("num",vo.getNum());
			json.put("lecturename",vo.getLecturename());
			json.put("sDate",vo.getsDate());
			json.put("eDate",vo.geteDate());
			json.put("memo",vo.getMemo());
			json.put("attendance",vo.getAttendance());
			arr.put(json);
		}
		return arr.toString();
	}
	
	@RequestMapping(value="/progress", produces="application/json;charset=utf-8", method=RequestMethod.GET)
	@ResponseBody
	public String medium(int scheduleNum, Model model) {
		List<Sche_detailVo> list = dService.sche_detailList(scheduleNum);
		int attCnt = dService.progress(scheduleNum);
		double pro1 = 0;
		if(list.size()==0) pro1 = 0;
		else pro1 = (double)attCnt/list.size();
		System.out.println(pro1);
		double pro = Double.parseDouble(String.format("%.2f",pro1));
		model.addAttribute("pro", pro);
		JSONObject obj = new JSONObject();
		obj.put("pro", pro*100);
		obj.put("scheduleNum", scheduleNum);
		return obj.toString();
	}
}
