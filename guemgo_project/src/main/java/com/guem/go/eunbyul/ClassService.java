package com.guem.go.eunbyul;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guem.go.woohyun.GosuVo;

@Service
public class ClassService {
	@Autowired private ClassDao dao;
	
	public int classinsert(LectureVo vo) {
		return dao.classinsert(vo);
	}
	public int areainsert(GosuareaVo vo) {
		return dao.areainsert(vo);
	}
	
	public List<LectureVo> classlist(int gonum) {
		return dao.classlist(gonum);
	}
	
	public List<CatemVo> catemlist(){
		return dao.catemlist();
	}
	public List<CatesVo> selectcates(String mname){
		return dao.selectcates(mname);
	}
	public List<CatesVo> cateslist(){
		return dao.cateslist();
	}
	public GosuVo gosuselect(String email) {
		return dao.gosuselect(email);
	}
}
