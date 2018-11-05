package com.guem.go.eunbyul;

public class LectureVo {
	public int lectureNum;
	public String lectureName;
	public String region1;
	public String region2;
	public String gender;
	public String day;
	public String time;
	public int gonum;
	
	public LectureVo() {}

	public LectureVo(int lectureNum, String lectureName, String region1, String region2, String gender, String day,
			String time, int gonum) {
		super();
		this.lectureNum = lectureNum;
		this.lectureName = lectureName;
		this.region1 = region1;
		this.region2 = region2;
		this.gender = gender;
		this.day = day;
		this.time = time;
		this.gonum = gonum;
	}

	public int getLectureNum() {
		return lectureNum;
	}

	public void setLectureNum(int lectureNum) {
		this.lectureNum = lectureNum;
	}

	public String getLectureName() {
		return lectureName;
	}

	public void setLectureName(String lectureName) {
		this.lectureName = lectureName;
	}

	public String getRegion1() {
		return region1;
	}

	public void setRegion1(String region1) {
		this.region1 = region1;
	}

	public String getRegion2() {
		return region2;
	}

	public void setRegion2(String region2) {
		this.region2 = region2;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
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
