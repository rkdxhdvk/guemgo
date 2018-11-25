package com.guem.go.woohyun;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.guem.go.eunbyul.CateService;
import com.guem.go.eunbyul.CatesVo;
import com.guem.go.eunbyul.ClassService;
import com.guem.go.eunbyul.SurveyService;
import com.guem.go.minsu.ReviewService;
import com.guem.go.minsu.ReviewVo;


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
	@Autowired
	private CateService cateservice;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private UsersService userService;
	@Autowired
	private ClassService classService;
	@Autowired
	private GosuService gosuService;
	
	@Autowired
	private SurveyService serveyService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {	
		
		List<CatesVo> list=cateservice.cateslist();
		ModelAndView mv=new ModelAndView(".main");
		mv.addObject("list", list);
		
		
		
		List<GosuVo> gosuList = gosuService.mainGosu();
		mv.addObject("gosuList", gosuList);
		
		int totalRequire = serveyService.totalRequire();
		int totalGosu = gosuService.totalGosu();
		int totalReview = reviewService.totalReview();
		int totalStar = reviewService.totlaStar();
		double avgStar = totalStar/totalReview;
		
		mv.addObject("totalRequire", totalRequire);
		mv.addObject("totalGosu", totalGosu);
		mv.addObject("avgStar", avgStar);
		
		//////////���� ����Խ��� //////////////
		List<ReviewVo> reviewList = reviewService.relist();
		ArrayList<HashMap<String, String>> userdetail = new ArrayList<>();
		for(ReviewVo vo : reviewList) {
			HashMap<String, String> usermap = new HashMap<>();
			usermap.put("username", userService.detail(vo.getEmail()).getName());
			usermap.put("gosuname", userService.detail(vo.getOther()).getName());
			usermap.put("reviewImg", reviewService.detail(vo.getReviewNum()).getImg());
			usermap.put("user", userService.detail(vo.getEmail()).getImage());
			usermap.put("lecture", classService.classSelect(vo.getFlag()).getLectureName());
			userdetail.add(usermap);
			System.out.println(usermap.get("gosuname")  + usermap.get("reviewImg"));
		}
		System.out.println();
		mv.addObject("reviewList", reviewList);
		mv.addObject("userdetail", userdetail);
		return mv;
	}
	
}
