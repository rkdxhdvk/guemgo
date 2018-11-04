package com.guem.go.kidong;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ChatController {
	@Autowired
	private ChatService service;
	
	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public String chat(int room,Model model) {
		List<ChatVo> list = service.list(room);
		service.update(room);
		model.addAttribute("list", list);
		model.addAttribute("room", room);
		return "/kidong/chat";
	}
	
}

