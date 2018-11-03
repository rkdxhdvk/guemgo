package com.guem.go.minsu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Sche_detailService{
	@Autowired
	private Sche_detailDao sche_detailDao;
	
	public int insert(Sche_detailVo vo) {
		return sche_detailDao.insert(vo);
	}
	public int sche_detailNum() {
		return sche_detailDao.sche_detailNum();
	}
}