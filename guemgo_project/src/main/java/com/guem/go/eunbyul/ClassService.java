package com.guem.go.eunbyul;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClassService {
	@Autowired private ClassDao dao;
	
	public int classinsert(LectureVo vo) {
		return dao.classinsert(vo);
	}
	
	public List<LectureVo> classlist(int gonum) {
		return dao.classlist(gonum);
	}
}
