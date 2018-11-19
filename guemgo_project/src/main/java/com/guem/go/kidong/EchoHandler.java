package com.guem.go.kidong;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;




public class EchoHandler extends TextWebSocketHandler{
	@Inject
	private ChatDao dao;
	
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		logger.info("{} �����", session.getId());
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("{}�� ���� {} ����", session.getId(), message.getPayload());
		
		ChatVo vo = ChatVo.convertMessage(message.getPayload());
		dao.insert(vo);
		vo.setMsg(vo.getMsg().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt").replaceAll("\n", "<br>"));
		System.out.println(vo.toString());
		
		for(WebSocketSession sess : sessionList) {
			Gson gson = new Gson();
			String msg = gson.toJson(vo);
			System.out.println(msg);
			sess.sendMessage(new TextMessage(msg));
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		logger.info("{} ���� ����", session.getId());
	}
}








