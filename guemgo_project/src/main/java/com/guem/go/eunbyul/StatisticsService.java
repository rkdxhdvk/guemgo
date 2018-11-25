package com.guem.go.eunbyul;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StatisticsService {
	@Autowired private StatisticsDao dao;
	public long countusers() {
		return dao.countusers();
	}
	public long countgosu() {
		return dao.countgosu();
	}
	public long countrequ() {
		return dao.countrequ();
	}
	public long countmatch() {
		return dao.countmatch();
	}
	public List<PayVo> payselect(){
		return dao.payselect();
	}
}
