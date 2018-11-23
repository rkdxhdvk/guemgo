package com.guem.go.eunbyul;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guem.go.minsu.MatchingVo;

@Service
public class OngoingService {
	@Autowired private OngoingDao dao;
	
	public List<RequireVo> select_ongoing(String email){
		return dao.select_ongoing(email);
	}
	public RequirelistVo select_email(int num) {
		return dao.select_email(num);
	}
	public LectureVo select_lec(int num){
		return dao.select_lec(num);
	}
	
	public List<MatchingVo> matchselect(String email) {
		return dao.matchselect(email);
	}
}
