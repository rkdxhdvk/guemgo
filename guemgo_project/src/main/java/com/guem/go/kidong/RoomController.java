package com.guem.go.kidong;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.guem.go.eunbyul.ClassService;
import com.guem.go.eunbyul.LectureVo;
import com.guem.go.woohyun.UsersService;

@Controller
public class RoomController {
	@Autowired
	private ChatService service;
	
	@Autowired
	private ClassService classService;
	
	@Autowired
	private UsersService userService;
	
	@RequestMapping(value = "/room", method = RequestMethod.GET)
	public String room(String email,Model model) {
		List<RoomVo> list = service.getRoom(email);
		
		for(RoomVo vo : list) {
			LectureVo vo2 = classService.classSelect(vo.getLecturenum());
			vo.setLecturename(vo2.getLectureName());
		}
		
		model.addAttribute("list", list);
		return ".kidong.room";
	}
	
	@RequestMapping(value="/makeRoom", method = RequestMethod.GET)
	public String makeRomm(String email, String other, int lecturenum, int req_num) {
		RoomVo vo = new RoomVo(0, email, other, lecturenum, null, req_num);
		service.makeRoom(vo);
		int room = service.selectRoom(vo);
		
		int point = -10;
		HashMap<String, Object> map = new HashMap<>();
		map.put("email", email);
		map.put("point", point);
		userService.userpoint(map);
		
		System.out.println("√§∆√√¢ " + req_num);
		return "redirect:/chat?room="+room+"&email="+email+"&other="+other+"&lecturenum="+lecturenum+"&req_num="+req_num+"";
	}
}
