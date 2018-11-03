package com.guem.go.minsu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ScheService{
	@Autowired
	private ScheduleDao scheduleDao;
	
	public int insert(ScheduleVo vo) {
		return scheduleDao.insert(vo);
	}
	public int scheduleNum() {
		return scheduleDao.scheduleNum();
	}
}
