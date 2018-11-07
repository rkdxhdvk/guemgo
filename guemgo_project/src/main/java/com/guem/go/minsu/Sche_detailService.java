package com.guem.go.minsu;

import java.util.List;

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
	public int update(Sche_detailVo vo) {
		return sche_detailDao.update(vo);
	}
	public Sche_detailVo sche_detail(int schedetailNum) {
		return sche_detailDao.sche_detail(schedetailNum);
	}
	public List<Sche_detailVo> sche_detailList(int scheduleNum){
		return sche_detailDao.scheList(scheduleNum);
	}
	public int sche_detailDelete(int schedetailNum) {
		return sche_detailDao.Sche_detailDelete(schedetailNum);
	}
	public int all_detailDelete(int scheduleNum) {
		return sche_detailDao.all_detailDelete(scheduleNum);
	}
}