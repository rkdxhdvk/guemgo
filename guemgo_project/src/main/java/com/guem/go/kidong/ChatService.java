package com.guem.go.kidong;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatService {
	@Autowired
	private ChatDao dao;
	
	public int insert(ChatVo vo) {
		return dao.insert(vo);
	}
	
	public List<ChatVo> list(int room){
		return dao.list(room);
	}
	
	public List<RoomVo> getRoom(String email) {
		return dao.getRoom(email);
	}
	
	public int update(Map<String, Object> map) {
		return dao.update(map);
	}
	
	public int makeRoom(RoomVo vo) {
		return dao.makeRomm(vo);
	}
	
	public int selectRoom(RoomVo vo) {
		return dao.selectRoom(vo);
	}
}
