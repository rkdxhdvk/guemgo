package com.guem.go.eunbyul;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.guem.go.woohyun.GosuService;
import com.guem.go.woohyun.GosuVo;

@Controller
public class LectureController {
	@Autowired
	private GosuService goService;
	@Autowired
	private ClassService classService;
	@Autowired
	private LectureService lecService;
	@Autowired
	private SurveyService surveyservice;
	@Autowired
	private CateService catesurvice;
	
	@RequestMapping(value="/lectureName", method=RequestMethod.GET)
	public String lecturename(String email, Model model) {
		int gonum = goService.gosuNum(email);
		List<LectureVo> list = classService.classlist(gonum);
		model.addAttribute("list", list);
		return ".select";
	}
	@RequestMapping(value="/mylecture",method=RequestMethod.GET)
	public ModelAndView mylecture(String email) {
		ModelAndView mv= new ModelAndView(".eunbyul.myLecture");
		System.out.println(email);
		GosuVo vo=classService.gosuselect(email);
		List<LectureVo> list=classService.classlist(vo.getGo_num());
		mv.addObject("list", list);
		return mv;
	}
	@RequestMapping(value="/classdelete",method=RequestMethod.GET)
	public ModelAndView classdelete(String lectureNum,String email) {
		System.out.println("강의번호:"+lectureNum);
		int lecNum=Integer.parseInt(lectureNum);
		System.out.println(lecNum);
		int n=lecService.classdelete(lecNum);
		System.out.println("성공"+n);
		ModelAndView mv =new ModelAndView();
		//mv.setView(new RedirectView("/mylecture?email=email"));
		mv.addObject("email", email);
		mv.setViewName("redirect:/sendlist");
		return mv;
	}
	@RequestMapping(value="/classUpdate",method=RequestMethod.GET)
	public ModelAndView classupdate(int lectureNum) {
		System.out.println("qqqqq"+lectureNum);
		//해당넘버의 정보를 가져와서 뿌려주는 기능
		LectureVo vo= classService.classSelect(lectureNum);
		//해당강의번호의 상세분야를 가져오는 메소드
		GosuareaVo vo2=lecService.gosuareaselect(lectureNum);
		//분야선택에서 뿌려줄 거
		//고수상세로 mnum가져오기
		System.out.println("1111"+vo2.getLectureNum());
		System.out.println("wwwww"+vo2.getArea());
		int mnum=catesurvice.selectmnum(vo2.getArea());
		System.out.println("eeeee"+mnum);
		//mnum으로 mname가져오기
		String mname=catesurvice.selectmname(mnum);
		//mnum으로 해당넘버의 cates가져와서 뿌려주기
		List<CatesVo> list=surveyservice.selectcates(mname);
		
		
		
		ModelAndView mv=new ModelAndView(".eunbyul.classUpdate");
		mv.addObject("vo", vo);
		mv.addObject("vo2", vo2);
		mv.addObject("list", list);
		return mv;
	}
	@RequestMapping(value="/classupdateOk",method=RequestMethod.POST)
	public String classupdateOk(HttpServletRequest request) {
		String area=request.getParameter("selectarea");
		String lectureName=request.getParameter("classname");
		String explanation=request.getParameter("explanation");
		String day=request.getParameter("days");
		String time=request.getParameter("time");
		String region1=request.getParameter("addr1");
		String region2=request.getParameter("addr2");
		String lecturenum=request.getParameter("lectureNum");
		int lectureNum=Integer.parseInt(lecturenum);
		LectureVo vo=new LectureVo(lectureNum, lectureName, region1, region2, day, time, 0, explanation, 0);
		GosuareaVo vo2=new GosuareaVo(area, lectureNum);
		int a=classService.areaupdate(vo2);
		int b=classService.classupdate(vo);
		
		if(a>0 && b>0) {
			return ".eunbyul.classupdateOk";
		}
		return ".eunbyul.statistics";
	}
	
}
