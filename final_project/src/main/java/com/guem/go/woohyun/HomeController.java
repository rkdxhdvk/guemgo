package com.guem.go.woohyun;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;

/*
	2018-10-24	������ ���ϻ���-Ȩ���丮 ����
 */
@Controller

public class HomeController {
/*	@ModelAttribute("header")
	public List<String> header(){
		List<String> list=new ArrayList<String>();
		list.add("�Ƿ�");
		list.add("�Ź�");
		list.add("ȭ��ǰ");
		return list;
	}*/
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {	
		return "index_new";
	}
	
}

