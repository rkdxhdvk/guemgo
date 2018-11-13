package com.guem.go.kidong;

import java.sql.Date;

public class GcommentVo {
	private int cnum;
	private String content;
	private int bnum;
	private Date regdate;
	private String email;

	public GcommentVo() {
	}

	public GcommentVo(int cnum, String content, int bnum, Date regdate, String email) {
		super();
		this.cnum = cnum;
		this.content = content;
		this.bnum = bnum;
		this.regdate = regdate;
		this.email = email;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getCnum() {
		return cnum;
	}

	public void setCnum(int cnum) {
		this.cnum = cnum;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

}
