package com.guem.go.kidong;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.guem.go.eunbyul.ClassService;
import com.guem.go.eunbyul.LectureVo;
import com.guem.go.minsu.ScheService;
import com.guem.go.minsu.Sche_detailService;
import com.guem.go.minsu.Sche_detailVo;
import com.guem.go.minsu.ScheduleVo;
import com.guem.go.woohyun.GosuService;
import com.guem.go.woohyun.GosuVo;

@Controller
public class ChatController {
	@Autowired
	private ChatService service;
	@Autowired
	private ClassService classService;
	@Autowired
	private GosuService gosuService;
	@Autowired
	private ScheService sService;
	@Autowired
	private Sche_detailService dServie;
	
	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public String chat(HttpServletRequest request, int room, int lecturenum, String lecturename, String other, int req_num, Model model) {
		
		int flag = (int)request.getSession().getAttribute("flag");
		System.out.println(flag);
		String email = (String)request.getSession().getAttribute("email");
		/*if(flag != 1) {
		////////// 강의이름 목록 가져오기//////////////
		int gonum = goService.gosuNum(email);
		List<LectureVo> lecList = classService.classlist(gonum);
		System.out.println(lecList);
		model.addAttribute("lecList", lecList);
		}
		/////////////////////////////////////////
*/		Map<String, Object> map = new HashMap<>();
		map.put("sender", email);
		map.put("room", room);
		List<ChatVo> list = service.list(room);
		for(ChatVo vo : list) {
			if(!vo.getSender().equals(email)) {
				service.update(map);
			}
			vo.setMsg(vo.getMsg().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt").replaceAll("\n", "<br>"));
		}
		System.out.println(email + " " + other + " " + lecturenum);
		HashMap<String, Object> schemap = new HashMap<>();
		if(flag==2) {
			schemap.put("email", email);
			schemap.put("other", other);
			schemap.put("lectureNum", lecturenum);
			System.out.println(schemap.get("email"));
			System.out.println(schemap.get("other"));
			System.out.println(schemap.get("lectureNum"));
			
		}else {
			schemap.put("email", other);
			schemap.put("other", email);
			schemap.put("lectureNum", lecturenum);
			System.out.println(schemap.get("email"));
			System.out.println(schemap.get("other"));
			System.out.println(schemap.get("lectureNum"));
			GosuVo gosuVo=gosuService.gosuDetail(other);
			List<GosuVo> lectureList = gosuService.gosuDetailLectureList(other);
			model.addAttribute("gosuVo", gosuVo);
			model.addAttribute("lectureList",lectureList); 
		}
		ScheduleVo scheVo = sService.isschedule(schemap);
		if(scheVo!=null) {
			List<Sche_detailVo> detailList = dServie.sche_detailList(scheVo.getScheduleNum());
			model.addAttribute("detailList", detailList);
			model.addAttribute("isschedule", 1);
			System.out.println("isschedule " + 1);
		}else {
			model.addAttribute("isschedule", 0);
			System.out.println("isschedule " + 0);
		}
		LectureVo lvo = classService.classSelect(lecturenum);
		model.addAttribute("req_num", req_num);
		model.addAttribute("other", other);
		model.addAttribute("lecturename", lecturename);
		model.addAttribute("list", list);
		model.addAttribute("room", room);
		model.addAttribute("lvo", lvo);
		return ".kidong.chat";
	}
	
}

