package com.guem.go.woohyun;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.guem.go.eunbyul.CateService;
import com.guem.go.eunbyul.CatesVo;
import com.guem.go.eunbyul.ClassService;
import com.guem.go.eunbyul.SurveyService;
import com.guem.go.kidong.ChatService;
import com.guem.go.minsu.ReviewService;
import com.guem.go.minsu.ReviewVo;


/*
	2018-10-24	윤우현 파일생성-홈디렉토리 변경
 */
@Controller

public class HomeController {
/*	@ModelAttribute("header")
	public List<String> header(){
		List<String> list=new ArrayList<String>();
		list.add("의류");
		list.add("신발");
		list.add("화장품");
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
	private ChatService chatService;
	
	@Autowired
	private SurveyService serveyService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(HttpSession session) {	
		
		List<CatesVo> list=cateservice.cateslist();
		ModelAndView mv=new ModelAndView(".main");
		mv.addObject("list", list);
		
		
		
		List<GosuVo> gosuList = gosuService.mainGosu();
		mv.addObject("gosuList", gosuList);
		ArrayList<Double> starAvg = new ArrayList<>();
		for(int i=0;i<5;i++) {
			int rev = reviewService.avgReview(gosuList.get(i).getEmail());
			System.out.println(rev);
			if(rev==0) {
				starAvg.add(0.0);
			}else {
				int star = reviewService.avgStar(gosuList.get(i).getEmail());
				starAvg.add((double) (star/rev));
			}
		}
		mv.addObject("starAvg", starAvg);
		
		int totalRequire = serveyService.totalRequire();
		int totalGosu = gosuService.totalGosu();
		int totalReview = reviewService.totalReview();
		int totalStar = reviewService.totlaStar();
		double avgStar = totalStar/totalReview;
		
		mv.addObject("totalRequire", totalRequire);
		mv.addObject("totalGosu", totalGosu);
		mv.addObject("avgStar", avgStar);
		
		
		//////////메인 리뷰게시판 //////////////
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
