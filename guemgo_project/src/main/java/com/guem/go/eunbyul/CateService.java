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
}
