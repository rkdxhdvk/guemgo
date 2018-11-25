package com.guem.go.woohyun;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.guem.go.eunbyul.PayVo;

@Repository
public class PointDao {
	@Autowired private SqlSession sqlSession;
	private static final String NAMESPACE="com.guem.go.mybatis.PointMapper";
	public void setSession(SqlSession session) {
		this.sqlSession = sqlSession;
	}
	
	// 포인트 이력 조회 DAO
	public List<PointVo> list(String email){
		return sqlSession.selectList(NAMESPACE + ".list",email); 
	}
	
	//포인트 이력 추가 DAO
	public int insert(PointVo vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}
	
	//포인트 충전1(users 테이블 point 업데이트) DAO
	public int point_update(PointVo vo) {
		return sqlSession.update(NAMESPACE + ".point_update", vo);
	}
	
	//포인트 충전2(point 테이블 point 충전내역 업데이트) DAO
	public int point_insert(PointVo vo) {
		return sqlSession.update(NAMESPACE + ".point_insert", vo);
	}
	
	//포인트 충전3(pay 테이블 pay 결재내역 업데이트) DAO
	public int pay_insert(PointVo vo) {
		return sqlSession.update(NAMESPACE + ".pay_insert", vo);
	}
}
