package com.guem.go.woohyun;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
/*
	2018-10-29	������ ���� ����
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
		vo.setFlag(1);	// ȸ�����Խ� ����� ����:�Ϲ�(0-������,1-�Ϲ�ȸ��,2-���)
		vo.setGrade("�ʱ�");	// ȸ�����Խ� �⺻ ȸ�����
		vo.setImage("");	// ȸ�����Խ� �⺻ �̹���
		vo.setPoint(500);	// ȸ�����Խ� �⺻ ����Ʈ
		int n=service.insert(vo);	// users ���̺� insert
		
		//	���ɻ� �߰� ���, ��� ��Ȯ�� �ʿ�
		/*
		String sname[] = request.getParameterValues("sname");
		
		
		for (int i=0;i<sname.length;i++) {
			vo.setSname(sname[i]);
			
			int j=service.cate_insert(vo);	// favorite ���̺� insert
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
