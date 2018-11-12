package com.guem.go.eunbyul;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LectureService {
	@Autowired private LectureDao dao;
	

	public int classdelete(int lecNum) {
		return dao.classdelete(lecNum);
	}
}
