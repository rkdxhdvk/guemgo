package com.guem.go.woohyun;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.guem.go.kidong.GboardService;
import com.guem.go.kidong.GboardVo;
import com.guem.go.kidong.PageUtil;


@Controller
@SessionAttributes("vo") //ModelAttribute에 담긴 vo를 SessionAttributes에 담기
public class MypageController {
	@Autowired private UsersService service;
	
	@Autowired
	private GboardService gboardService;
/*	
	@ModelAttribute("vo")
	public MemberVo email(String email) {
		MemberVo vo=service.detail(email);
		return vo;
	}
*/	
	@RequestMapping("/mypage")
	public ModelAndView mypage(String email) {
		UsersVo vo=service.detail(email);
		ModelAndView mv=new ModelAndView(".myPage");
		mv.addObject("vo",vo);
		return mv;
	}	
	
/*
	@RequestMapping(value="/update",method=RequestMethod.GET)
	public String update() {
		return "update";
	}
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String updateOk(MemberVo vo,SessionStatus st) {
		service.update(vo);
		st.setComplete();//SessionAttributes에 담긴 vo객체 지우기
		return "redirect:/";
	}
*/
	@RequestMapping("/selectGboard")
	public String selectGboard(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model,HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		String email = (String)request.getSession().getAttribute("email");
		map.put("email", email);
		int totalRowCount = gboardService.getCount(map);
		PageUtil pu = new PageUtil(pageNum, totalRowCount, 10, 5);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());

		List<GboardVo> list = gboardService.list(map);
		
		model.addAttribute("pu", pu);
		model.addAttribute("list", list);
		return ".selectGboard";
	}	
}











