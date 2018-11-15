package com.guem.go.eunbyul;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class CateController {
	@Autowired
	private CateService cateservice;
	
	@RequestMapping(value="/search", method = RequestMethod.GET)
	public ModelAndView search(String search,HttpServletRequest request) {
		List<CatelVo> llist=cateservice.catellist();
		List<CatemVo> mlist=cateservice.catemlist();
		List<CatesVo> slist=cateservice.cateslist();
		ModelAndView mv = new ModelAndView(); 
		
		mv.setViewName(".main");
		 
		
		//1.검색어가 catel에 있으면 해당 catel에 해당하는 catem에 해당하는 cates를 모두 뿌려준다
		for(int i=0;i<llist.size();i++) {
			if(search.contains(llist.get(i).getLname())){
				System.out.println("라지랑같은");
				List<CatesVo> list= cateservice.sfroml(search);
				mv.addObject("list", list);
			}
		}
		//2.검색어가 catem에있으면 해당 catem에 cates를 뿌려준다.
		for(int i=0;i<mlist.size();i++) {
			if(search.contains(mlist.get(i).getMname())) {
				System.out.println("미디움랑같은");
				List<CatesVo> list=cateservice.sfromm(search);
				mv.addObject("list", list);
			}
		}
		
		
		
		//3.검색어가 cates에 해당한다면 바로 설문지로 넘어간다.
		for(int i=0; i<slist.size(); i++) {
			if(slist.get(i).getSname().contains(search)) {//상세분야는 비슷한 
				System.out.println("스몰랑같은");
				mv.setView(new RedirectView("survey"));
				mv.addObject("area", slist.get(i).getSname());
		        return mv;
			}
		}
		String aaa="bbb";
		mv.addObject("area", aaa);
		return mv;
	}
}
