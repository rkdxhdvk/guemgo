package com.guem.go.minsu;

import java.util.Date;

public class MatchingVo {
	private int matchingNum;
	private int matchNum;
	private int lectureNum;
	private String gosu;
	private String student;
	private Date matchDate;
	
	public MatchingVo() {}

	public MatchingVo(int matchingNum, int matchNum, int lectureNum, String gosu, String student, Date matchDate) {
		super();
		this.matchingNum = matchingNum;
		this.matchNum = matchNum;
		this.lectureNum = lectureNum;
		this.gosu = gosu;
		this.student = student;
		this.matchDate = matchDate;
	}

	public int getMatchingNum() {
		return matchingNum;
	}

	public void setMatchingNum(int matchingNum) {
		this.matchingNum = matchingNum;
	}

	public int getMatchNum() {
		return matchNum;
	}

	public void setMatchNum(int matchNum) {
		this.matchNum = matchNum;
	}

	public int getLectureNum() {
		return lectureNum;
	}

	public void setLectureNum(int lectureNum) {
		this.lectureNum = lectureNum;
	}

	public String getGosu() {
		return gosu;
	}

	public void setGosu(String gosu) {
		this.gosu = gosu;
	}

	public String getStudent() {
		return student;
	}

	public void setStudent(String student) {
		this.student = student;
	}

	public Date getMatchDate() {
		return matchDate;
	}

	public void setMatchDate(Date matchDate) {
		this.matchDate = matchDate;
	}
	
	
}
