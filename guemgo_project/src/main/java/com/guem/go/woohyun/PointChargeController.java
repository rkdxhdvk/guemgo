package com.guem.go.woohyun;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
/*
-------------------------------
	2018-11-13	윤우현 파일 생성
-------------------------------
*/
@Controller
public class PointChargeController {
	@Autowired private UsersService userService;
	@Autowired private PointService pointService;

	
	@RequestMapping(value="/pointCharge",method=RequestMethod.GET)
	public  ModelAndView pointcharge(HttpSession session, HttpServletResponse response) {
		String email = (String)session.getAttribute("email");
		
		if (email == null) {
			return new ModelAndView("redirect:/");
		}
		
		ModelAndView mv = new ModelAndView(".pointCharge");
		
		UsersVo vo = userService.detail(email);
		mv.addObject("vo", vo);
		
		return mv;
	}
	
	@RequestMapping(value="/pointCharge",method=RequestMethod.POST)
	public  ModelAndView pointcharge(PointVo vo) {
			int n=pointService.update(vo);
			//System.out.println(vo.getMnum);

			ModelAndView mv=new ModelAndView("woohyun/result");
			if(n>0) {
				mv.addObject("code","pointChange_success");
//				System.out.println("업데이트콘트롤러POST-성공");
			}else {
				mv.addObject("code","pointChange_fail");
//				System.out.println("업데이트콘트롤러POST-실패");
			}
//			System.out.println("업데이트콘트롤러POST-완료");
			mv.addObject("goUrl","/");
			return mv;
		}
	
	
}











