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
		
		
		//1.�˻�� catel�� ������ �ش� catel�� �ش��ϴ� catem�� �ش��ϴ� cates�� ��� �ѷ��ش�
		for(int i=0;i<llist.size();i++) {
			if(search.equals(llist.get(i).getLname())){
				
			}
		}
		//2.�˻�� catem�������� �ش� catem�� cates�� �ѷ��ش�.
		for(int i=0;i<mlist.size();i++) {
			if(search.equals(mlist.get(i).getMname())) {
				
			}
		}
		
		
		//3.�˻�� cates�� �ش��Ѵٸ� �ٷ� �������� �Ѿ��.
		for(int i=0; i<slist.size(); i++) {
			if(search.equals(slist.get(i).getSname())) {
				
			}
		}
	}
}
