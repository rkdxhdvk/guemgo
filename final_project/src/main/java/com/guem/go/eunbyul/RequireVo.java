package com.guem.go.eunbyul;

public class RequireVo {
	private int matchnum;
	private String email;
	private int m_num;
	private int begin;
	
	public RequireVo() {	}	

	public RequireVo(int matchnum, String email, int m_num, int begin) {
		super();
		this.matchnum = matchnum;
		this.email = email;
		this.m_num = m_num;
		this.begin = begin;
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
	
	
	
}
