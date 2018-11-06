package com.guem.go.woohyun;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
/*
	2018-10-31	������ ���� ����
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
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}

















