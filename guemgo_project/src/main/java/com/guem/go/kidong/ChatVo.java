package com.guem.go.kidong;

import java.sql.Date;

import com.google.gson.Gson;

public class ChatVo {
	private int msg_num;
	private int room;
	private String msg;
	private Date time;
	private String sender;
	private int read;
	private String receiver;
	
	public ChatVo() {
	}

	public ChatVo(int msg_num, int room, String msg, Date time, String sender, int read, String receiver) {
		super();
		this.msg_num = msg_num;
		this.room = room;
		this.msg = msg;
		this.time = time;
		this.sender = sender;
		this.read = read;
		this.receiver = receiver;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public int getMsg_num() {
		return msg_num;
	}

	public void setMsg_num(int msg_num) {
		this.msg_num = msg_num;
	}

	public int getRoom() {
		return room;
	}

	public void setRoom(int room) {
		this.room = room;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public int getRead() {
		return read;
	}

	public void setRead(int read) {
		this.read = read;
	}

	public static ChatVo convertMessage(String source) {
		ChatVo message = new ChatVo();
		Gson gson = new Gson();
		message = gson.fromJson(source, ChatVo.class);
		return message;
	}

	@Override
	public String toString() {
		return "ChatVo [msg_num=" + msg_num + ", room=" + room + ", msg=" + msg + ", time=" + time + ", sender="
				+ sender + ", read=" + read + "]";
	}

}
