package com.guem.go.eunbyul;


import java.util.List;

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
	
	private LectureService lecService;
	
	@RequestMapping(value="/lectureName", method=RequestMethod.GET)
	public String lecturename(String email, Model model) {
		int gonum = goService.gosuNum(email);
		List<LectureVo> list = classService.classlist(gonum);
		model.addAttribute("list", list);
		return ".select";
	}
	@RequestMapping(value="/mylecture",method=RequestMethod.GET)
	public ModelAndView mylecture(String email) {
		ModelAndView mv= new ModelAndView("eunbyul/myLecture");
		System.out.println(email);
		GosuVo vo=classService.gosuselect(email);
		List<LectureVo> list=classService.classlist(vo.getGo_num());
		mv.addObject("list", list);
		return mv;
	}
	@RequestMapping(value="/classdelete",method=RequestMethod.GET)
	public String classdelete(String lectureNum) {
		System.out.println("강의번호:"+lectureNum);
		int lecNum=Integer.parseInt(lectureNum);
		System.out.println(lecNum);
		int n=lecService.classdelete(lecNum);
		ModelAndView mv =new ModelAndView();
		//mv.setView(new RedirectView("/mylecture?email=email"));
		return "redirect:mylecture.do";
	}
	
}
