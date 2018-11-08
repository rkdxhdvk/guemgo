package com.guem.go.eunbyul;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.annotation.SessionScope;
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
		String email=(String)request.getSession().getAttribute("email");
		if(email == null || email == "") {
			return "login";
		}
		model.addAttribute("list", list);
		model.addAttribute("quelist", quelist);
		model.addAttribute("exlist", exlist);
		model.addAttribute("area", area);
	
        return "eunbyul/survey";
	}

	@RequestMapping(value = "/survey", method = RequestMethod.POST)
	public ModelAndView surveyOk(HttpServletRequest request) {
		
		
		String area=request.getParameter("selectarea");//�ϰ���� ����
		String[] ans= new String[10];
		ans[0]=request.getParameter("purpose"); //����(���,�Խ�...)
		ans[1]=request.getParameter("experience"); //���(�Թ�,1��..)
		ans[2]=request.getParameter("age"); 
		//int age=Integer.parseInt(age1); //�л�����
		ans[3]=request.getParameter("day");//����
		ans[4]=request.getParameter("time"); //��ô�?
		ans[5]=request.getParameter("times"); //�ָ��?
		ans[6]=request.getParameter("hour"); //��ð�?
		ans[7]=request.getParameter("start"); //������
		String addr1=request.getParameter("addr1"); 
		String region[] = addr1.split(" ");
		ans[8]=region[0]+region[1]; //ex)���ֵ� ��������
		String addr2=request.getParameter("addr2"); 
		String region2=""; //�������ּ� 
		for(int i=2; i<region.length; i++){ 
			region2+=(region[i]+" ");
		}
		region2+=addr2;	
		ans[9]=request.getParameter("anything"); //�ϰ������

		String email=request.getParameter("email");//�α��� ����� email
		//��û�� �����
				CatemVo mvo=surveyservice.selectcatem(area);
				RequireVo vo=new RequireVo(0, email , mvo.m_num, 0 , null);
				int n=surveyservice.insert(vo);//require���̺� insert

		//�亯 ���̺� �� �ֱ�
			int n1=0;
			for(int i=2; i<12; i++) {
			AnswerVo vo2 = new AnswerVo(0, 0, i, ans[i-2]);
			n1=surveyservice.ansinsert(vo2);
			}
		
		
		
		ModelAndView mv = new ModelAndView(); 
		mv.addObject("n", n);
		mv.addObject("n1", n1);
		mv.setViewName("eunbyul/surveyOk");
		 return mv;
		
	}
}
