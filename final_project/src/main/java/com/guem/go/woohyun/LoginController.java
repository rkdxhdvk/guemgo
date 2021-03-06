package com.guem.go.woohyun;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
/*
	2018-10-31	윤우현 파일 생성
*/
@Controller
public class LoginController {
	@Autowired private LoginService service;
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login() {
		return "woohyun/login";
	}
	@RequestMapping(value="/login",method=RequestMethod.POST)
	//public String login(String id,String pwd) {
	//public String login(HttpServletRequest request,HttpSession session) {//이것도 가능
	public String login(HttpServletRequest request) {
		String email=request.getParameter("email");
		String pwd=request.getParameter("pwd");
		HashMap<String,String> map=new HashMap<String, String>();
		map.put("email",email);
		map.put("pwd",pwd);
		MemberVo vo=service.isMember(map);
		if(vo!=null) {
			HttpSession session=request.getSession();
			System.out.println("email이 " + vo.getEmail() + "의 div는" + vo.getMdiv());
			session.setAttribute("email",email);
			session.setAttribute("mdiv",vo.getMdiv());	// mdiv를 어떻게 얻어올것인가???
			return "redirect:/"; //리다이렉트 방식으로 이동하기
		}else {
			request.setAttribute("errMsg","아이디 또는 비밀번호가 맞지 않아요.");
			return "woohyun/login";
		}
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}

















