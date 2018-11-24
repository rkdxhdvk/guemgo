package com.guem.go.eunbyul;

import java.util.Date;

public class OngoingVo {
	//매칭번호, 강의명, 강의시작일, 고수이메일,진행상황
	public int matchingnum;
	public String lecturename;
	public String gosuemail;
	public Date startday;
	public int state;
	public int scheduleNum;
	
	public OngoingVo() {}

	public OngoingVo(int matchingnum, String lecturename, String gosuemail, Date startday, int state, int scheduleNum) {
		super();
		this.matchingnum = matchingnum;
		this.lecturename = lecturename;
		this.gosuemail = gosuemail;
		this.startday = startday;
		this.state = state;
		this.scheduleNum = scheduleNum;
	}

	public int getMatchingnum() {
		return matchingnum;
	}

	public void setMatchingnum(int matchingnum) {
		this.matchingnum = matchingnum;
	}

	public String getLecturename() {
		return lecturename;
	}

	public void setLecturename(String lecturename) {
		this.lecturename = lecturename;
	}

	public String getGosuemail() {
		return gosuemail;
	}

	public void setGosuemail(String gosuemail) {
		this.gosuemail = gosuemail;
	}

	public Date getStartday() {
		return startday;
	}

	public void setStartday(Date startday) {
		this.startday = startday;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getScheduleNum() {
		return scheduleNum;
	}

	public void setScheduleNum(int scheduleNum) {
		this.scheduleNum = scheduleNum;
	}

	
	
}
