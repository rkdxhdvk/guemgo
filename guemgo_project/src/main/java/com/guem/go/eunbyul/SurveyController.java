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
		//질문 찾아서 담기
		List<QuestionVo> quelist=surveyservice.quelist();
		//보기 찾아서 담기
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
		
		
		String area=request.getParameter("selectarea");//하고싶은 과목
		String[] ans= new String[10];
		ans[0]=request.getParameter("purpose"); //목적(취미,입시...)
		ans[1]=request.getParameter("experience"); //경력(입문,1년..)
		ans[2]=request.getParameter("age"); 
		//int age=Integer.parseInt(age1); //학생나이
		ans[3]=request.getParameter("day");//요일
		ans[4]=request.getParameter("time"); //몇시대?
		ans[5]=request.getParameter("times"); //주몇번?
		ans[6]=request.getParameter("hour"); //몇시간?
		ans[7]=request.getParameter("start"); //시작일
		String addr1=request.getParameter("addr1"); 
		String region[] = addr1.split(" ");
		ans[8]=region[0]+region[1]; //ex)제주도 서귀포시
		String addr2=request.getParameter("addr2"); 
		String region2=""; //나머지주소 
		for(int i=2; i<region.length; i++){ 
			region2+=(region[i]+" ");
		}
		region2+=addr2;	
		ans[9]=request.getParameter("anything"); //하고싶은말

		String email=request.getParameter("email");//로그인 사용자 email
		//요청서 만들기
				CatemVo mvo=surveyservice.selectcatem(area);
				RequireVo vo=new RequireVo(0, email , mvo.m_num, 0 , null);
				int n=surveyservice.insert(vo);//require테이블에 insert

		//답변 테이블에 값 넣기
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
