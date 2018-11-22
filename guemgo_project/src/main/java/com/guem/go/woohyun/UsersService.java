package com.guem.go.woohyun;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guem.go.minsu.ReviewVo;


/*
	2018-10-29	������ ���� ����
*/
@Service
public class UsersService {
	@Autowired private UsersDao dao;
	public void setDao(UsersDao dao) {
		this.dao = dao;
	}	
	// ȸ������ 
	public int insert(UsersVo vo) {
		return dao.insert(vo);
	}
	
	// ȸ������Ʈ ��ȸ
	/*public List<UsersVo> list(){
		return dao.list();
	}*/
	
	// ȸ������
//	public int delete(String email) {
//		return dao.delete(email);
//	}
	// ȸ������
	public int update_f(String email) {
		return dao.update_f(email);
	}
	
	// ȸ�� ���� ����(1�� ��ȸ)
	public UsersVo detail(String email) {
//		System.out.println("���� ��ȸ�κ�");
//		System.out.println(email);
		return dao.detail(email);
	}
	
	// ȸ�� ���� ����(������Ʈ)
	public int update(UsersVo vo) {
//		System.out.println("���� �κ�");
		return dao.update(vo);
	}
	
	//ȸ�� ����Ʈ ����
	public int poitnUpdate(HashMap<String, Object> map) {
		return dao.pointUpdate(map);
	}
	
	//����¡ ó�� �� �˻�
	public List<UsersVo> list(Map<String, Object> map){
		return dao.list(map);
	}
	public int getCount(Map<String, Object> map) {
		return dao.getCount(map);
	}
	
	// ȸ�� ���Խ� ���ɻ� 
	public int cate_insert(UsersVo vo){
		return dao.cate_insert(vo);
	}
	
	//����Ʈ ������Ʈ
	public int userpoint(HashMap<String, Object> map) {
		return dao.userpoint(map);
	}
}
