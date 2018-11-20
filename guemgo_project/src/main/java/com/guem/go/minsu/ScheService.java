package com.guem.go.minsu;

import java.util.HashMap;
import java.util.List;

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
	public int schedelete(int scheduleNum) {
		return scheduleDao.schedelete(scheduleNum);
	}
	public List<ScheduleVo> schelist(String email){
		return scheduleDao.scheList(email);
	}
	public List<ScheduleVo> userschelist(String other){
		return scheduleDao.userscheList(other);
	}
	public ScheduleVo isschedule(HashMap<String, Object> map) {
		return scheduleDao.isschedule(map);
	}
}
