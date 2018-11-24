package com.guem.go.eunbyul;

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
}
