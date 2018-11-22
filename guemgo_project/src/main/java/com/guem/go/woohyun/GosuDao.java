package com.guem.go.woohyun;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GosuDao {
	@Autowired private SqlSession sqlSession;
	private static final String NAMESPACE="com.guem.go.mybatis.GosuMapper";
	public void setSession(SqlSession session) {
		this.sqlSession = sqlSession;
	}
	
	// 고수가입 DAO
	public int insert(GosuVo vo) {
		return sqlSession.insert(NAMESPACE + ".insert",vo);
	}
	
	//	??
	public int gosuNum(String email) {
		return sqlSession.selectOne(NAMESPACE + ".gosuNum", email);
	}

	// 고수리스트 조회 DAO
	/*public List<GosuVo> list(){
		return sqlSession.selectList(NAMESPACE + ".list");
	}*/
	
	// 고수 삭제 DAO
//	public int delete(String email) {
//		return sqlSession.delete(NAMESPACE + ".delete",email);
//	}
	// 고수 삭제 DAO
	public int update_f(String email) {
		return sqlSession.update(NAMESPACE + ".update_f",email);
	}
	
	// 고수 정보 수정(1명 조회) DAO
	public GosuVo detail(String email) {
		return sqlSession.selectOne(NAMESPACE + ".detail", email); 
	}
	
	// 고수 정보 수정(업데이트) DAO
	public int update(GosuVo vo) {
		return sqlSession.update(NAMESPACE + ".update", vo);
	}
	
	// 고수 정보 수정(업데이트) DAO
	public int update_user(GosuVo vo) {
		return sqlSession.update(NAMESPACE + ".update_user", vo);
	}
		
	// 고수 프로필 업데이트1 DAO
	public int update_profile1(GosuVo vo) {
		return sqlSession.update(NAMESPACE + ".update_profile1", vo);
	}
	
	// 고수 프로필 업데이트2 DAO
	public int update_profile2(GosuVo vo) {
		return sqlSession.update(NAMESPACE + ".update_profile2", vo);
	}
	
	// 고수 프로필 업데이트3 DAO
	public int update_profile3(GosuVo vo) {
		return sqlSession.update(NAMESPACE + ".update_profile3", vo);
	}
	
	//페이징 처리 및 검색
		public List<GosuVo> list(Map<String, Object> map) {
			return sqlSession.selectList(NAMESPACE +".list", map);
		}
		public int getCount(Map<String, Object> map) {
			return sqlSession.selectOne(NAMESPACE +".getCount", map);
		}
		
	// 고수 프로필 디테일 조회(1명 조회) DAO
		public GosuVo gosuDetail(String email) {
			return sqlSession.selectOne(NAMESPACE + ".gosuDetail", email); 
		}
		
	// 고수 프로필 디테일 강의 조회
	public  List<GosuVo> gosuDetailLectureList(String email) {
		return sqlSession.selectList(NAMESPACE + ".gosuDetailLectureList", email); 
	}
}
