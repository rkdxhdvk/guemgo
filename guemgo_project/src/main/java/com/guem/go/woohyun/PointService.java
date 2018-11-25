package com.guem.go.woohyun;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guem.go.eunbyul.PayVo;

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
	
	// 포인트 충전1
		public int point_update(PointVo vo) {
			return dao.point_update(vo);
		}
		
	// 포인트 충전2
		public int point_insert(PointVo vo) {
			return dao.point_insert(vo);
		}
	
	// 포인트 충전3
		public int pay_insert(PointVo vo) {
			return dao.pay_insert(vo);
		}
	
}