package com.kh.firstclass.user.schedule.model.vo;

public class chatLog {
	
	private String mono;
	private String chatmsg;
	private String chattime;
	
	
	public chatLog(String mono, String chatmsg, String chattime) {
		super();
		this.mono = mono;
		this.chatmsg = chatmsg;
		this.chattime = chattime;
	}
	public chatLog() {
		super();
	}
	
	public String getMono() {
		return mono;
	}
	public void setMono(String mono) {
		this.mono = mono;
	}
	public String getChatmsg() {
		return chatmsg;
	}
	public void setChatmsg(String chatmsg) {
		this.chatmsg = chatmsg;
	}
	public String getChattime() {
		return chattime;
	}
	public void setChattime(String chattime) {
		this.chattime = chattime;
	}

	@Override
	public String toString() {
		return "chatLog [mono=" + mono + ", chatmsg=" + chatmsg + ", chattime=" + chattime + "]";
	}
}
