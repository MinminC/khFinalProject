package com.kh.firstclass.user.schedule.controller;

import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class WebSocketServer extends TextWebSocketHandler {
	
	
	private Set<WebSocketSession> users = new CopyOnWriteArraySet<WebSocketSession>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		users.add(session);
		System.out.println("접속");
		System.out.println("session : " + session);

	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("수신");
		System.out.println("session : " + session);
		System.out.println("message : " + message);
		
		TextMessage newMessage = new TextMessage(message.getPayload());
		
		
		
		for (WebSocketSession ws : users) {
				ws.sendMessage(newMessage);
		}

	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		users.remove(session);
		System.out.println("종료");
		System.out.println("session : " + session);
		System.out.println("status : " + status);
	}


}
