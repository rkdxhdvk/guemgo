package com.guem.go.minsu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EventService {
	@Autowired
	private EventDao dao;
	
	public int insert(EventVo vo) {
		return dao.insert(vo);
	}
	public List<EventVo> list(String email){
		return dao.list(email);
	}
}
