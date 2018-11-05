package com.guem.go.woohyun;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/*
---------------------------------------------
	2018-11-02	������ ���� ����
---------------------------------------------
*/
@Service
public class CateService {
	@Autowired private CateDao dao;
	public void setDao(CateDao dao) {
		this.dao = dao;
	}	
	
	// cate_l ��ȸ
	public List<CateVo> cate_l_list(){
		return dao.cate_l_list();
	}
	
	// cate_m ��ȸ
	public List<CateVo> cate_m_list(){
		return dao.cate_m_list();
	}
}
