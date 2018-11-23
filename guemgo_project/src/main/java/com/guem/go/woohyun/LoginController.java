package com.guem.go.woohyun;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.guem.go.eunbyul.CatemVo;
import com.guem.go.eunbyul.CatesVo;
import com.guem.go.eunbyul.ExampleVo;
import com.guem.go.eunbyul.QuestionVo;
import com.guem.go.eunbyul.SurveyService;
/*
	2018-10-31	윤우현 파일 생성
*/
@Controller
public class LoginController {
	@Autowired private LoginService service;
	@Autowired private SurveyService surveyservice;
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login() {
		return "woohyun/login";
	}
	
/*	@RequestMapping(value="/login",method=RequestMethod.POST)
	//public String login(String id,String pwd) {
	//public String login(HttpServletRequest request,HttpSession session) {//이것도 가능
	public String login(HttpServletRequest request) {
		String email=request.getParameter("email");
		String pwd=request.getParameter("pwd");
		HashMap<String,String> map=new HashMap<String, String>();
		map.put("email",email);
		map.put("pwd",pwd);
		UsersVo vo=service.isMember(map);
		if(vo!=null) {
			HttpSession session=request.getSession();
			//System.out.println("email이 " + vo.getEmail() + "의 flag는" + vo.getFlag());
			session.setAttribute("email",email);	// 세션에 이메일로 로그인 여부 판별
			session.setAttribute("flag",vo.getFlag());	// 세션에 플래그로 관리자, 일반회원 판별
			session.setAttribute("gosuYN",vo.getGosuyn());	// 세션에 이메일로 고수등록여부 판별
			return "redirect:/"; //리다이렉트 방식으로 이동하기
		}else {
			request.setAttribute("errMsg","아이디 또는 비밀번호가 맞지 않아요.");
			return "woohyun/login";
		}
	}*/
	
	////////////////11.15서은별 로그인 수정중
	@RequestMapping(value="/login",method=RequestMethod.POST)
	//public String login(String id,String pwd,String email) {
	//public String login(HttpServletRequest request,HttpSession session) {//이것도 가능
	public ModelAndView login(HttpServletRequest request) {
		String email=request.getParameter("email");
		String pwd=request.getParameter("pwd");
		HashMap<String,String> map=new HashMap<String, String>();
		map.put("email",email);
		map.put("pwd",pwd);
		UsersVo vo=service.isMember(map);
		ModelAndView mv = new ModelAndView(); 
		String area=request.getParameter("area");
		if(vo!=null) {
			CatemVo cvo=surveyservice.selectcatem("포토샵");
			String mname=cvo.getMname();
			List<CatesVo> list=surveyservice.selectcates(mname);
			//질문 찾아서 담기
			List<QuestionVo> quelist=surveyservice.quelist();
			//보기 찾아서 담기
			List<ExampleVo> exlist=surveyservice.exlist();

			mv.addObject("list", list);
			mv.addObject("quelist", quelist);
			mv.addObject("exlist", exlist);
			mv.addObject("area", area);
			HttpSession session=request.getSession();
			//System.out.println("email이 " + vo.getEmail() + "의 flag는" + vo.getFlag());
			session.setAttribute("email",email);	// 세션에 이메일로 로그인 여부 판별
			session.setAttribute("flag",vo.getFlag());	// 세션에 플래그로 관리자, 일반회원 판별
			session.setAttribute("gosuYN",vo.getGosuyn());	// 세션에 이메일로 고수등록여부 판별
			session.setAttribute("name",vo.getName());	// 세션에 name등록
			System.out.println(vo.getImage());
			session.setAttribute("img",vo.getImage());
			mv.setViewName("redirect:/");
			return mv; //리다이렉트 방식으로 이동하기
		}else {
			request.setAttribute("errMsg","아이디 또는 비밀번호가 맞지 않아요.");
			mv.setViewName("woohyun/login");
			return mv;
		}
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value = "/loginValid", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String loginValid(String email, String pwd, HttpSession session) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("pwd", pwd);

		JSONObject obj = new JSONObject();
		if (null != service.isMember(map)) {
			obj.put("result", "ok");
		} else {
			obj.put("errMsg", "no");
		}
		return obj.toString();
	}
}

















