package com.guem.go.kidong;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NboardService {
	@Autowired
	private NboardDao dao;

	public int insert(NboardVo vo) {
		return dao.insert(vo);
	}

	public List<NboardVo> list(Map<String, Object> map) {
		return dao.list(map);
	}

	public int getCount(Map<String, Object> map) {
		return dao.getCount(map);
	}

	public NboardVo detail(int num) {
		return dao.detail(num);
	}

	public int hitUp(int num) {
		return dao.hitUp(num);
	}

	public int update(NboardVo vo) {
		return dao.update(vo);
	}

	public int delete(int num) {
		return dao.delete(num);
	}

	public NboardVo next(int num) {
		return dao.next(num);
	}

	public NboardVo prev(int num) {
		return dao.prev(num);
	}
}
