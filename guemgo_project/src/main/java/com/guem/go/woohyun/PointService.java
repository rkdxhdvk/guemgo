package com.guem.go.woohyun;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guem.go.eunbyul.PayVo;

/*
--------------------------
	2018-11-13	������ ����
--------------------------
*/

@Service
public class PointService {
	@Autowired private PointDao dao;
	public void setDao(PointDao dao) {
		this.dao = dao;
	}
	
	// ����Ʈ ��� �̷� ��ȸ
	public List<PointVo> list(String email) {
		return dao.list(email);
	}
	
	//����Ʈ ��� �̷� �߰�
		public int insert(PointVo vo) {
			return dao.insert(vo);
		}
	
	// ����Ʈ ����1
		public int point_update(PointVo vo) {
			return dao.point_update(vo);
		}
		
	// ����Ʈ ����2
		public int point_insert(PointVo vo) {
			return dao.point_insert(vo);
		}
	
	// ����Ʈ ����3
		public int pay_insert(PointVo vo) {
			return dao.pay_insert(vo);
		}
	
}