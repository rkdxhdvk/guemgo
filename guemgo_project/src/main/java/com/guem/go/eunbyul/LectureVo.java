package com.guem.go.eunbyul;

public class LectureVo {
	public int lectureNum;
	public String lectureName;
	public String region1;
	public String region2;
	public String day;
	public String time;
	public int go_num;
	public String explanation;
	
	public LectureVo() {}

	public LectureVo(int lectureNum, String lectureName, String region1, String region2, String day, String time,
			int go_num, String explanation) {
		super();
		this.lectureNum = lectureNum;
		this.lectureName = lectureName;
		this.region1 = region1;
		this.region2 = region2;
		this.day = day;
		this.time = time;
		this.go_num = go_num;
		this.explanation = explanation;
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

	public int getGo_num() {
		return go_num;
	}

	public void setGo_num(int go_num) {
		this.go_num = go_num;
	}

	public String getExplanation() {
		return explanation;
	}

	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}
	
	
}
