package com.guem.go.eunbyul;

import java.sql.Date;

public class RequireVo {
	private int matchnum;
	private String email;
	private int mnum;
	private int begin;
	private Date matchdate;
	
	public RequireVo() {	}	

	public RequireVo(int matchnum, String email, int mnum, int begin, Date matchdate) {
		super();
		this.matchnum = matchnum;
		this.email = email;
		this.mnum = mnum;
		this.begin = begin;
		this.matchdate=matchdate;
	}


	public int getMatchnum() {
		return matchnum;
	}

	public void setMatchnum(int matchnum) {
		this.matchnum = matchnum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getMnum() {
		return mnum;
	}

	public void setMnum(int mnum) {
		this.mnum = mnum;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public Date getMatchdate() {
		return matchdate;
	}

	public void setMatchdate(Date matchdate) {
		this.matchdate = matchdate;
	}
	
	
	
}
