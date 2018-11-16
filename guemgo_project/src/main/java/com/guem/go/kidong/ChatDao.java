package com.guem.go.kidong;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDao {
	@Autowired
	private SqlSession session;
	
	public int insert(ChatVo vo) {
		return session.insert("com.jhta.mybatis.ChatMapper.insert",vo);
	}
	
	public List<ChatVo> list(int room){
		return session.selectList("com.jhta.mybatis.ChatMapper.list",room);
	}
	
	public List<RoomVo> getRoom(String email) {
		return session.selectList("com.jhta.mybatis.ChatMapper.getRoom", email);
	}
	
	public int update(int room) {
		return session.update("com.jhta.mybatis.ChatMapper.read", room);
	}
	
	public int makeRomm(RoomVo vo) {
		return session.insert("com.jhta.mybatis.ChatMapper.makeRoom", vo);
	}
}
