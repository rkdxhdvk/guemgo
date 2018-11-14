package com.guem.go.eunbyul;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CateController {
	@Autowired
	private CateService cateservice;
	
	@RequestMapping(value="/search", method = RequestMethod.GET)
	public void search(String search) {
		List<CatelVo> llist=cateservice.catellist();
		List<CatemVo> mlist=cateservice.catemlist();
		List<CatesVo> slist=cateservice.cateslist();
		
		
		//1.검색어가 catel에 있으면 해당 catel에 해당하는 catem에 해당하는 cates를 모두 뿌려준다
		for(int i=0;i<llist.size();i++) {
			if(search.equals(llist.get(i).getLname())){
				
			}
		}
		//2.검색어가 catem에있으면 해당 catem에 cates를 뿌려준다.
		for(int i=0;i<mlist.size();i++) {
			if(search.equals(mlist.get(i).getMname())) {
				
			}
		}
		
		
		//3.검색어가 cates에 해당한다면 바로 설문지로 넘어간다.
		for(int i=0; i<slist.size(); i++) {
			if(search.equals(slist.get(i).getSname())) {
				
			}
		}
	}
}
