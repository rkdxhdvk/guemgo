package com.guem.go.woohyun;

import java.util.Date;
/*
 ------------------------
	2018-11-13	À±¿ìÇö »ý¼º
 ------------------------	
*/
public class PointVo {
	private int num;
	private String email;
	private Date pointdate;
	private int division;
	private String detail;
	private int dpoint;
	private int lpoint;
	
	public PointVo() {}
	
	

	public PointVo(int num, String email, Date pointdate, int division, String detail, int dpoint, int lpoint) {
		super();
		this.num = num;
		this.email = email;
		this.pointdate = pointdate;
		this.division = division;
		this.detail = detail;
		this.dpoint = dpoint;
		this.lpoint = lpoint;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getPointdate() {
		return pointdate;
	}

	public void setPointdate(Date pointdate) {
		this.pointdate = pointdate;
	}

	public int getDivision() {
		return division;
	}

	public void setDivision(int division) {
		this.division = division;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public int getDpoint() {
		return dpoint;
	}

	public void setDpoint(int dpoint) {
		this.dpoint = dpoint;
	}

	public int getLpoint() {
		return lpoint;
	}

	public void setLpoint(int lpoint) {
		this.lpoint = lpoint;
	}
	
}
