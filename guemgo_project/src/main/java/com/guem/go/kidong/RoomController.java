package com.guem.go.kidong;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RoomController {
	@Autowired
	private ChatService service;
	
	@RequestMapping(value = "/room", method = RequestMethod.GET)
	public String room(String email,Model model) {
		List<RoomVo> list = service.getRoom(email);
		model.addAttribute("list", list);
		return "/kidong/room";
	}
}
