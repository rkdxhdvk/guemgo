package com.guem.go.eunbyul;

import java.sql.Date;

public class RequireVo {
	private int matchnum;
	private String email;
	private int m_num;
	private int begin;
	private Date matchdate;
	
	public RequireVo() {	}	

	public RequireVo(int matchnum, String email, int m_num, int begin, Date matchdate) {
		super();
		this.matchnum = matchnum;
		this.email = email;
		this.m_num = m_num;
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

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
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
