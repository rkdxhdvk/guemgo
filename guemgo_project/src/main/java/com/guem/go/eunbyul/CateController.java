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
		 
		
		//1.�˻�� catel�� ������ �ش� catel�� �ش��ϴ� catem�� �ش��ϴ� cates�� ��� �ѷ��ش�
		for(int i=0;i<llist.size();i++) {
			if(search.contains(llist.get(i).getLname())){
				System.out.println("����������");
				List<CatesVo> list= cateservice.sfroml(search);
				mv.addObject("list", list);
			}
		}
		//2.�˻�� catem�������� �ش� catem�� cates�� �ѷ��ش�.
		for(int i=0;i<mlist.size();i++) {
			if(search.contains(mlist.get(i).getMname())) {
				System.out.println("�̵�������");
				List<CatesVo> list=cateservice.sfromm(search);
				mv.addObject("list", list);
			}
		}
		
		
		
		//3.�˻�� cates�� �ش��Ѵٸ� �ٷ� �������� �Ѿ��.
		for(int i=0; i<slist.size(); i++) {
			if(slist.get(i).getSname().contains(search)) {//�󼼺оߴ� ����� 
				System.out.println("����������");
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
