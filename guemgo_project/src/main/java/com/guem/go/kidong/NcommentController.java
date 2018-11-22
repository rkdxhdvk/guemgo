package com.guem.go.kidong;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class NcommentController {
	@Autowired
	private NcommentService service;
	
	@Autowired
	private NreplyService service2;
	
	@RequestMapping(value="/ncomment/insert",method=RequestMethod.POST)
	public String insert(NcommentVo vo) {
		try {
			int num = vo.getNum();
			service.insert(vo);
			return "redirect:/nboard/detail?num="+num+"&sort=1&scroll=1";
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	@RequestMapping(value="/ncomment/delete",method=RequestMethod.GET)
	public String delete(int cnum,int num) {
		try {
			service.delete(cnum);
			return "redirect:/nboard/detail?num="+num+"&sort=1&scroll=1";
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	@RequestMapping(value="/nreply/insert",method=RequestMethod.POST)
	public String insertReply(NreplyVo vo,int num) {
		try {
			service2.insert(vo);
			return "redirect:/nboard/detail?num="+num+"&sort=1&scroll=1";
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	@RequestMapping(value="/nreply/delete", method=RequestMethod.GET)
	public String deleteReply(int rnum,int num) {
		System.out.println(rnum);
		try {
			service2.delete(rnum);
			return "redirect:/nboard/detail?num="+num+"&sort=1&scroll=1";
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	
}
