package com.guem.go.woohyun;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	// ����Ʈ ����
		public int update(PointVo vo) {
			return dao.update(vo);
		}
}
