package com.guem.go.woohyun;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/*
---------------------------------------------
	2018-11-02	윤우현 파일 생성
---------------------------------------------
*/
@Service
public class CateService {
	@Autowired private CateDao dao;
	public void setDao(CateDao dao) {
		this.dao = dao;
	}	
	
	// cate_l 조회
	public List<CateVo> cate_l_list(){
		return dao.cate_l_list();
	}
	
	// cate_m 조회
	public List<CateVo> cate_m_list(){
		return dao.cate_m_list();
	}
}
