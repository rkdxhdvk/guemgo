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
	2018-10-31	������ ���� ����
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
	//public String login(HttpServletRequest request,HttpSession session) {//�̰͵� ����
	public String login(HttpServletRequest request) {
		String email=request.getParameter("email");
		String pwd=request.getParameter("pwd");
		HashMap<String,String> map=new HashMap<String, String>();
		map.put("email",email);
		map.put("pwd",pwd);
		UsersVo vo=service.isMember(map);
		if(vo!=null) {
			HttpSession session=request.getSession();
			//System.out.println("email�� " + vo.getEmail() + "�� flag��" + vo.getFlag());
			session.setAttribute("email",email);	// ���ǿ� �̸��Ϸ� �α��� ���� �Ǻ�
			session.setAttribute("flag",vo.getFlag());	// ���ǿ� �÷��׷� ������, �Ϲ�ȸ�� �Ǻ�
			session.setAttribute("gosuYN",vo.getGosuyn());	// ���ǿ� �̸��Ϸ� �����Ͽ��� �Ǻ�
			return "redirect:/"; //�����̷�Ʈ ������� �̵��ϱ�
		}else {
			request.setAttribute("errMsg","���̵� �Ǵ� ��й�ȣ�� ���� �ʾƿ�.");
			return "woohyun/login";
		}
	}*/
	
	////////////////11.15������ �α��� ������
	@RequestMapping(value="/login",method=RequestMethod.POST)
	//public String login(String id,String pwd,String email) {
	//public String login(HttpServletRequest request,HttpSession session) {//�̰͵� ����
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
			CatemVo cvo=surveyservice.selectcatem("���伥");
			String mname=cvo.getMname();
			List<CatesVo> list=surveyservice.selectcates(mname);
			//���� ã�Ƽ� ���
			List<QuestionVo> quelist=surveyservice.quelist();
			//���� ã�Ƽ� ���
			List<ExampleVo> exlist=surveyservice.exlist();

			mv.addObject("list", list);
			mv.addObject("quelist", quelist);
			mv.addObject("exlist", exlist);
			mv.addObject("area", area);
			HttpSession session=request.getSession();
			//System.out.println("email�� " + vo.getEmail() + "�� flag��" + vo.getFlag());
			session.setAttribute("email",email);	// ���ǿ� �̸��Ϸ� �α��� ���� �Ǻ�
			session.setAttribute("flag",vo.getFlag());	// ���ǿ� �÷��׷� ������, �Ϲ�ȸ�� �Ǻ�
			session.setAttribute("gosuYN",vo.getGosuyn());	// ���ǿ� �̸��Ϸ� �����Ͽ��� �Ǻ�
			session.setAttribute("name",vo.getName());	// ���ǿ� name���
			System.out.println(vo.getImage());
			session.setAttribute("img",vo.getImage());
			mv.setViewName("redirect:/");
			return mv; //�����̷�Ʈ ������� �̵��ϱ�
		}else {
			request.setAttribute("errMsg","���̵� �Ǵ� ��й�ȣ�� ���� �ʾƿ�.");
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

















