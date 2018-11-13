package com.guem.go.kidong;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QboardService {
	@Autowired
	private QboardDao qboardDao;
	
	public int getMaxNum() {
		return qboardDao.getMaxNum();
	}
	
	public int getCount(Map<String, Object> map) {
		return qboardDao.getCount(map);
	}
	
	public int insert(QboardVo qboardVo) {
		return qboardDao.insert(qboardVo);
	}
	
	public int insertReply(Map<String, Object> map) {
		return qboardDao.insertReply(map);
	}
	
	public List<QboardVo> list(Map<String, Object> map) {
		return qboardDao.list(map);
	}
	
	public QboardVo detail(int qna_num) {
		return qboardDao.detail(qna_num);
	}
	
	public int update(QboardVo qboardVo) {
		return qboardDao.update(qboardVo);
	}
	
	public int addHit(int qna_num) {
		return qboardDao.addHit(qna_num);
	}
	
	public int delete(int qna_num) {
		return qboardDao.delete(qna_num);
	}
	
	public int deleteGrp(int grp) {
		return qboardDao.deleteGrp(grp);
	}
	
	public int addFlag(int grp) {
		return qboardDao.addFlag(grp);
	}
	
	public List<QboardVo> select(int grp){
		return qboardDao.select(grp);
	}
}













