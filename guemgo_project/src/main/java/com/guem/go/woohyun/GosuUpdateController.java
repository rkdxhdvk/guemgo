package com.guem.go.woohyun;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
/*
	2018-11-07	������ ���� ����
*/
@Controller
public class GosuUpdateController {
	@Autowired private GosuService service;
	
	//request�� ���޵� �����͸� �Ķ���� ������ ������� �����
	//(String Ÿ���� DateŸ������ ��ȯ�ϱ�)
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		CustomDateEditor dateEditor=
				new CustomDateEditor(new SimpleDateFormat("yyyy/MM/dd"),true);
		binder.registerCustomEditor(Date.class, dateEditor);
	}
	
	public void setService(GosuService service) {
		this.service = service;
	}
	@RequestMapping(value="/GosuUpdate",method=RequestMethod.GET)
	public ModelAndView updateForm(String email) {
		GosuVo vo=service.detail(email);
		ModelAndView mv=new ModelAndView("woohyun/gosuUpdate");
		mv.addObject("vo",vo);
//		System.out.println("������Ʈ��Ʈ�ѷ�GET �Ϸ�");
		return mv;
	}
	
	@RequestMapping(value="/GosuUpdate",method=RequestMethod.POST)
	@Transactional
	public ModelAndView update(GosuVo vo) {
		int n=service.update(vo);
		int j=service.update_user(vo);
		//System.out.println(vo.getMnum);

		ModelAndView mv=new ModelAndView("woohyun/result");
		if(n>0 && j>0) {
			mv.addObject("code","success");
//			System.out.println("������Ʈ��Ʈ�ѷ�POST-����");
		}else {
			mv.addObject("code","fail");
//			System.out.println("������Ʈ��Ʈ�ѷ�POST-����");
		}
//		System.out.println("������Ʈ��Ʈ�ѷ�POST-�Ϸ�");
		return mv;
	}
}











