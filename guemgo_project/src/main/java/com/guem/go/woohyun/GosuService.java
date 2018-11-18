package com.guem.go.woohyun;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/*
---------------------------------------------
	2018-11-02	윤우현 파일 생성
---------------------------------------------
*/
@Service
public class GosuService {
	@Autowired private GosuDao dao;
	public void setDao(GosuDao dao) {
		this.dao = dao;
	}	
	
	// 고수등록 
	public int insert(GosuVo vo) {
		return dao.insert(vo);
	}
	
	//고수넘버  
	public int gosuNum(String email) {
		return dao.gosuNum(email);
	}
	
	// 고수리스트 조회
	/*public List<GosuVo> list(){
		return dao.list();
	}*/
	
	// 고수 삭제
	public int delete(String email) {
		return dao.delete(email);
	}
	
	// 고수 정보 수정(1명 조회)
	public GosuVo detail(String email) {
		return dao.detail(email);
	}
	
	// 고수 정보 수정(업데이트)
	public int update(GosuVo vo) {
		return dao.update(vo);
	}
	
	// 고수 정보 수정(업데이트)
	public int update_user(GosuVo vo) {
		return dao.update_user(vo);
	}
	
	// 고수 프로필 업데이트1
	public int update_profile1(GosuVo vo) {
		return dao.update_profile1(vo);
	}
	
	// 고수 프로필 업데이트2
	public int update_profile2(GosuVo vo) {
		return dao.update_profile2(vo);
	}
	
	//페이징 처리 및 검색
		public List<GosuVo> list(Map<String, Object> map){
			return dao.list(map);
		}
		public int getCount(Map<String, Object> map) {
			return dao.getCount(map);
		}
}
