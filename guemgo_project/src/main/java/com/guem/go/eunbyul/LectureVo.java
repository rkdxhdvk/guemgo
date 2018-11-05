package com.guem.go.eunbyul;

public class LectureVo {
	public String gender;
	public int lectureNum;
	public String region;
	public String day;
	public String time;
	public int gonum;
	
	public LectureVo() {}

	public LectureVo(String gender, int lectureNum, String region, String day, String time, int gonum) {
		super();
		this.gender = gender;
		this.lectureNum = lectureNum;
		this.region = region;
		this.day = day;
		this.time = time;
		this.gonum = gonum;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getLectureNum() {
		return lectureNum;
	}

	public void setLectureNum(int lectureNum) {
		this.lectureNum = lectureNum;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getGonum() {
		return gonum;
	}

	public void setGonum(int gonum) {
		this.gonum = gonum;
	}
	
	
	
}
