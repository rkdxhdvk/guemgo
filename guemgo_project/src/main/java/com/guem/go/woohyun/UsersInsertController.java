package com.guem.go.woohyun;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
/*
	2018-10-29	윤우현 파일 생성
*/

import com.guem.go.eunbyul.CateService;
import com.guem.go.eunbyul.CatesVo;

@Controller
public class UsersInsertController {
	@Autowired private UsersService service;
	@Autowired private CateService cateservice;
	
	@RequestMapping(value="/UserInsert",method=RequestMethod.GET)
	public ModelAndView insert() {
		List<CatesVo> list=cateservice.cateslist();
		ModelAndView mv=new ModelAndView("woohyun/userInsert");
		mv.addObject("list", list);
		return mv;
	}
	
	
	@RequestMapping(value="/UserInsert",method=RequestMethod.POST)
	public ModelAndView insertOk(UsersVo vo, HttpServletRequest request) {
		vo.setFlag(1);	// 회원가입시 사용자 구분:일반(0-관리자,1-일반회원,2-고수)
		vo.setGrade("초급");	// 회원가입시 기본 회원등급
		vo.setImage("");	// 회원가입시 기본 이미지
		vo.setPoint(500);	// 회원가입시 기본 포인트
		int n=service.insert(vo);	// users 테이블 insert
		
		//	관심사 추가 기능, 기능 재확인 필요
		/*
		String sname[] = request.getParameterValues("sname");
		
		
		for (int i=0;i<sname.length;i++) {
			vo.setSname(sname[i]);
			
			int j=service.cate_insert(vo);	// favorite 테이블 insert
		}
		 */
		ModelAndView mv=new ModelAndView("woohyun/result");
		
		if(n>0) {
			mv.addObject("code","join_success");
		}else {
			mv.addObject("code","join_fail");
		}
		
		mv.addObject("goUrl","/");
		return mv;
	}
}
