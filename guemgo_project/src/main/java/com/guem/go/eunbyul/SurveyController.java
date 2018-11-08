package com.guem.go.eunbyul;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class SurveyController {
	@Autowired
	private SurveyService surveyservice;
	@RequestMapping(value = "/survey", method = RequestMethod.GET)
	public String survey(HttpServletRequest request, Model model){
		String area=request.getParameter("area");
		CatemVo vo=surveyservice.selectcatem(area);
		String mname=vo.getM_name();
		List<CatesVo> list=surveyservice.selectcates(mname);
		System.out.println(area+mname);
		//���� ã�Ƽ� ���
		List<QuestionVo> quelist=surveyservice.quelist();
		//���� ã�Ƽ� ���
		List<ExampleVo> exlist=surveyservice.exlist();

		model.addAttribute("list", list);
		model.addAttribute("quelist", quelist);
		model.addAttribute("exlist", exlist);
		model.addAttribute("area", area);
        return "eunbyul/survey";
	}

	@RequestMapping(value = "/survey", method = RequestMethod.POST)
	public ModelAndView surveyOk(HttpServletRequest request) {
		String purpose=request.getParameter("purpose"); //����(���,�Խ�...)
		String experience=request.getParameter("experience"); //���(�Թ�,1��..)
		String age1=request.getParameter("int"); 
		//int age=Integer.parseInt(age1); //�л�����
		String times=request.getParameter("times"); //�ָ��?
		String time=request.getParameter("time"); //��ô�?
		String start=request.getParameter("start"); //������?
		String anything=request.getParameter("anything"); //�ϰ������
		String area=request.getParameter("selectarea");
		String addr1=request.getParameter("addr1"); 
		String region[] = addr1.split(" ");
		String region1=region[0]+region[1]; //ex)���ֵ� ��������
		String addr2=request.getParameter("addr2"); 
		String region2=""; //�������ּ� 
		for(int i=2; i<region.length; i++){ 
			region2+=(region[i]+" ");
		}
		region2+=addr2;	
		String email=request.getParameter("email");
		System.out.println(email);
/*		System.out.println(area);
		System.out.println(purpose);
		System.out.println(experience);
		System.out.println(age);
		System.out.println(times);
		System.out.println(region1);
		System.out.println(region2);
		System.out.println(anything);*/

		
		
		
		
		CatemVo mvo=surveyservice.selectcatem(area);
		System.out.println("ī�װ���ȣ:"+mvo.m_num);
		RequireVo vo=new RequireVo(0, email , mvo.m_num, 0 , null);
		int n=surveyservice.insert(vo);//require���̺� insert
		ModelAndView mv = new ModelAndView();
		 mv.addObject("n", n);
		 mv.setViewName("eunbyul/surveyOk");
		 return mv;
		
	}
}
