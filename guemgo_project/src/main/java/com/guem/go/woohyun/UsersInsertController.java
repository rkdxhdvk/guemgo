package com.guem.go.woohyun;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
/*
	2018-10-29	������ ���� ����
*/

@Controller
public class UsersInsertController {
	@Autowired private UsersService service;
	
	@RequestMapping(value="/UserInsert",method=RequestMethod.GET)
	public String insert() {
		return "woohyun/userInsert";
	}
	
	@RequestMapping(value="/UserInsert",method=RequestMethod.POST)
	public ModelAndView insertOk(UsersVo vo) {
		vo.setFlag(1);	// ȸ�����Խ� ����� ����:�Ϲ�(0-������,1-�Ϲ�ȸ��,2-���)
		vo.setGrade("�ʱ�");	// ȸ�����Խ� �⺻ ȸ�����
		vo.setImage("0");	// ȸ�����Խ� �⺻ �̹���
		vo.setPoint(50);	// ȸ�����Խ� �⺻ ����Ʈ
		int n=service.insert(vo);
		ModelAndView mv=new ModelAndView("woohyun/result");
		if(n>0) {
			mv.addObject("code","success");
		}else {
			mv.addObject("code","fail");
		}
		return mv;
	}
}
