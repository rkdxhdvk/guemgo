package com.guem.go.kidong;

import java.sql.Date;

public class NcommentVo {
	private int cnum;
	private int num;
	private String email;
	private String content;
	private Date regdate;

	public NcommentVo() {
	}

	public NcommentVo(int cnum, int num, String email, String content, Date regdate) {
		super();
		this.cnum = cnum;
		this.num = num;
		this.email = email;
		this.content = content;
		this.regdate = regdate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getCnum() {
		return cnum;
	}

	public void setCnum(int cnum) {
		this.cnum = cnum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

}
