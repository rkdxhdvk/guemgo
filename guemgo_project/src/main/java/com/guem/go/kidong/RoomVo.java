package com.guem.go.kidong;

public class RoomVo {
	private int room;
	private String email;
	private String other;
	private int lecturenum;
	private String lecturename;

	public RoomVo() {
	}

	public RoomVo(int room, String email, String other, int lecturenum, String lecturename) {
		super();
		this.room = room;
		this.email = email;
		this.other = other;
		this.lecturenum = lecturenum;
		this.lecturename = lecturename;
	}

	public int getLecturenum() {
		return lecturenum;
	}

	public void setLecturenum(int lecturenum) {
		this.lecturenum = lecturenum;
	}

	public String getLecturename() {
		return lecturename;
	}

	public void setLecturename(String lecturename) {
		this.lecturename = lecturename;
	}

	public void setRoom(int room) {
		this.room = room;
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
