package com.guem.go.woohyun;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/*
--------------------------
	2018-11-13	윤우현 생성
--------------------------
*/

@Service
public class PointService {
	@Autowired private PointDao dao;
	public void setDao(PointDao dao) {
		this.dao = dao;
	}
	
	// 포인트 사용 이력 조회
	public List<PointVo> list(String email) {
		return dao.list(email);
	}
	
	//포인트 사용 이력 추가
		public int insert(PointVo vo) {
			return dao.insert(vo);
		}
	
	// 포인트 충전
		public int update(PointVo vo) {
			return dao.update(vo);
		}
}
