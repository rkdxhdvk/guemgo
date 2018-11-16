package com.guem.go.eunbyul;

import java.sql.Date;

public class RequirelistVo {
	public int num;
	public String email;
	public Date req_date;
	public int req_num;
	public String lecturename;
	
	public RequirelistVo() {	}

	public RequirelistVo(int num, String email, Date req_date, int req_num, String lecturename) {
		super();
		this.num = num;
		this.email = email;
		this.req_date = req_date;
		this.req_num = req_num;
		this.lecturename = lecturename;
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

	public Date getReq_date() {
		return req_date;
	}

	public void setReq_date(Date req_date) {
		this.req_date = req_date;
	}

	public int getReq_num() {
		return req_num;
	}

	public void setReq_num(int req_num) {
		this.req_num = req_num;
	}

	public String getLecturename() {
		return lecturename;
	}

	public void setLecturename(String lecturename) {
		this.lecturename = lecturename;
	}	
	
	
	
	
}
