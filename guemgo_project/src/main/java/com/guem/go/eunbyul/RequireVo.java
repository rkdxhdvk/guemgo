package com.guem.go.eunbyul;

import java.sql.Date;

public class RequireVo {
	private int req_num;
	private String email;
	private int lec_start;
	private int mnum;
	private Date req_date;
	
	public RequireVo() {	}

	public RequireVo(int req_num, String email, int lec_start, int mnum, Date req_date) {
		super();
		this.req_num = req_num;
		this.email = email;
		this.lec_start = lec_start;
		this.mnum = mnum;
		this.req_date = req_date;
	}

	public int getReq_num() {
		return req_num;
	}

	public void setReq_num(int req_num) {
		this.req_num = req_num;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getLec_start() {
		return lec_start;
	}

	public void setLec_start(int lec_start) {
		this.lec_start = lec_start;
	}

	public int getMnum() {
		return mnum;
	}

	public void setMnum(int mnum) {
		this.mnum = mnum;
	}

	public Date getReq_date() {
		return req_date;
	}

	public void setReq_date(Date req_date) {
		this.req_date = req_date;
	}	
}
