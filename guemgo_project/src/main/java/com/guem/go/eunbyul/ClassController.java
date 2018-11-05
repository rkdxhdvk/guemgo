package com.guem.go.eunbyul;



import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ClassController {
	@Autowired
	private ClassService classService;
	
	@RequestMapping(value = "/classinsert", method = RequestMethod.GET)
	public ModelAndView classinsert(String gonum){

		System.out.println(gonum);
		//���⼭ area�� ī�װ�(��)���̺� ��Ī�� ���ؼ� �ش� ��Ī�� �߳ѹ��� ã�´�
		//�߳ѹ��� ã�Ƽ� ī�װ� ������ ����
		ModelAndView mv= new ModelAndView("eunbyul/classinsert");
		mv.addObject("gonum", gonum);
		
        return mv;
	}
	@RequestMapping(value="/classinsertOk", method=RequestMethod.POST)
	public void insertOk(HttpServletRequest request) {
		String classname=request.getParameter("classname");
		String gender=request.getParameter("sex");
		String gonum=request.getParameter("gonum");
		int num=Integer.parseInt(gonum);
		String[] area=request.getParameterValues("area");
		String[] days=request.getParameterValues("days");
		String time=request.getParameter("time");
		String addr1=request.getParameter("addr1");
		String addr2=request.getParameter("addr2");
		String day=null;
		for(int i=0; i<area.length; i++	) {
			System.out.println(area[i]);
		}
		for(int i=0; i<days.length; i++	) {
			day+=days[i];
		}
		System.out.println(classname + gender + "����ѹ�:"+num+time+addr1+addr2+day);
		//LectureVo vo=new LectureVo(gender, 0, addr1, day, time, num);
		//classService.classinsert(vo);
		
	
	}
	
	@RequestMapping(value="/classlist",method=RequestMethod.GET)
	public void  classlist() {
		
	}
	
}
