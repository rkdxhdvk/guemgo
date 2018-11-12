package com.guem.go.minsu;

public class ScheduleVo {
	private int scheduleNum;
	private String email;
	private String other;
	private int num;
	private int matchNum;
	private String lecturename;
	public ScheduleVo() {
		// TODO Auto-generated constructor stub
	}

	public ScheduleVo(int scheduleNum, String email, String other, int num, int matchNum, String lecturename) {
		super();
		this.scheduleNum = scheduleNum;
		this.email = email;
		this.other = other;
		this.num = num;
		this.matchNum = matchNum;
		this.lecturename = lecturename;
	}

	public int getScheduleNum() {
		return scheduleNum;
	}

	public void setScheduleNum(int scheduleNum) {
		this.scheduleNum = scheduleNum;
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

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getMatchNum() {
		return matchNum;
	}

	public void setMatchNum(int matchNum) {
		this.matchNum = matchNum;
	}

	public String getLecturename() {
		return lecturename;
	}

	public void setLecturename(String lecturename) {
		this.lecturename = lecturename;
	}
	
	
}
