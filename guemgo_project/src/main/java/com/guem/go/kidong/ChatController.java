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
import com.guem.go.woohyun.GosuService;

@Controller
public class ChatController {
	@Autowired
	private ChatService service;
	@Autowired
	private ClassService classService;
	@Autowired
	private GosuService goService;
	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public String chat(HttpServletRequest request, int room,int lecturenum,Model model) {
		
		////////// 강의이름 목록 가져오기//////////////
		String email = (String)request.getSession().getAttribute("email");
		int gonum = goService.gosuNum(email);
		List<LectureVo> lecList = classService.classlist(gonum);
		System.out.println(lecList);
		model.addAttribute("lecList", lecList);
		/////////////////////////////////////////
		Map<String, Object> map = new HashMap<>();
		map.put("sender", email);
		map.put("room", room);
		List<ChatVo> list = service.list(room);
		for(ChatVo vo : list) {
			if(!vo.getSender().equals(email)) {
				service.update(map);
			}
		}
		
		LectureVo vo = classService.classSelect(lecturenum);
	
		model.addAttribute("list", list);
		model.addAttribute("room", room);
		model.addAttribute("vo", vo);
		return "/kidong/chat";
	}
	
}

