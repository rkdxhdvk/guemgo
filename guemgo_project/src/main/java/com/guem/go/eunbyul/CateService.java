package com.guem.go.eunbyul;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CateService {
	@Autowired
	private CateDao dao;
	
	public List<CatelVo> catellist(){
		return dao.catellist();
	}
	public List<CatemVo> catemlist(){
		return dao.catemlist();	
	}
	public List<CatesVo> selectcates(String mname){
		return dao.selectcates(mname);
	}
	public List<CatesVo> cateslist(){
		return dao.cateslist();
	}
	public List<CatesVo> sfroml(String lname){
		return dao.sfroml(lname);
	}
	public List<CatesVo> sfromm(String mname){
		return dao.sfromm(mname);	
	}
	
/////고수찾기 카테고리/////
	public List<CatemVo> medium(int lnum) {
		return dao.medium(lnum);
	}
	public List<CatesVo> small(int mnum) {
		return dao.small(mnum);
	}
}
