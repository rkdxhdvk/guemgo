package com.guem.go.eunbyul;

import java.util.Date;

public class OngoingVo {
	//매칭번호, 강의명, 강의시작일, 고수이메일,진행상황
	public int matchingnum;
	public String lecturename;
	public String gosuemail;
	public String startday;
	public int state;
	public int scheduleNum;
	public int lectureNum;
	
	public OngoingVo() {}

	public OngoingVo(int matchingnum, String lecturename, String gosuemail, String startday, int state, int scheduleNum,
			int lectureNum) {
		super();
		this.matchingnum = matchingnum;
		this.lecturename = lecturename;
		this.gosuemail = gosuemail;
		this.startday = startday;
		this.state = state;
		this.scheduleNum = scheduleNum;
		this.lectureNum = lectureNum;
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

	public String getStartday() {
		return startday;
	}

	public void setStartday(String startday) {
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

	public int getLectureNum() {
		return lectureNum;
	}

	public void setLectureNum(int lectureNum) {
		this.lectureNum = lectureNum;
	}
	
	
	
}