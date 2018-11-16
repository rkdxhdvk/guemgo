package com.guem.go.kidong;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.guem.go.eunbyul.ClassService;
import com.guem.go.eunbyul.LectureVo;

@Controller
public class RoomController {
	@Autowired
	private ChatService service;
	
	@Autowired
	private ClassService classService;
	
	
	@RequestMapping(value = "/room", method = RequestMethod.GET)
	public String room(String email,Model model) {
		List<RoomVo> list = service.getRoom(email);
		
		for(RoomVo vo : list) {
			LectureVo vo2 = classService.classSelect(vo.getLecturenum());
			vo.setLecturename(vo2.getLectureName());
		}
		
		model.addAttribute("list", list);
		return "/kidong/room";
	}
}
