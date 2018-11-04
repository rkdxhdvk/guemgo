package com.guem.go.kidong;

public class RoomVo {
	private int room;
	private String email;
	private String other;
	
	public RoomVo() {}

	public RoomVo(int room, String email, String other) {
		super();
		this.room = room;
		this.email = email;
		this.other = other;
	}

	public int getRoom() {
		return room;
	}

	public void setRomm(int room) {
		this.room = room;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

	
	
}
