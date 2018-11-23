package com.guem.go.woohyun;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guem.go.minsu.ReviewVo;


/*
	2018-10-29	윤우현 파일 생성
*/
@Service
public class UsersService {
	@Autowired private UsersDao dao;
	public void setDao(UsersDao dao) {
		this.dao = dao;
	}	
	// 회원가입 
	public int insert(UsersVo vo) {
		return dao.insert(vo);
	}
	
	// 회원리스트 조회
	/*public List<UsersVo> list(){
		return dao.list();
	}*/
	
	// 회원삭제
//	public int delete(String email) {
//		return dao.delete(email);
//	}
	// 회원삭제
	public int update_f(String email) {
		return dao.update_f(email);
	}
	
	// 회원 정보 수정(1명 조회)
	public UsersVo detail(String email) {
//		System.out.println("서비스 조회부분");
//		System.out.println(email);
		return dao.detail(email);
	}
	
	// 회원 정보 수정(업데이트)
	public int update(UsersVo vo) {
//		System.out.println("서비스 부분");
		return dao.update(vo);
	}
	
	//회원 포인트 수정
	public int poitnUpdate(HashMap<String, Object> map) {
		return dao.pointUpdate(map);
	}
	
	//페이징 처리 및 검색
	public List<UsersVo> list(Map<String, Object> map){
		return dao.list(map);
	}
	public int getCount(Map<String, Object> map) {
		return dao.getCount(map);
	}
	
	// 회원 가입시 관심사 
	public int cate_insert(UsersVo vo){
		return dao.cate_insert(vo);
	}
	
	//포인트 업데이트
	public int userpoint(HashMap<String, Object> map) {
		return dao.userpoint(map);
	}
}
