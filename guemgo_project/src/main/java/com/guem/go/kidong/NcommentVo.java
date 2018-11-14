package com.guem.go.kidong;

import java.sql.Date;

public class NcommentVo {
	private int cnum;
	private int num;
	private String email;
	private String content;
	private Date regdate;
	private int ref;
	private int lev;
	private int step;

	public NcommentVo() {
	}

	public NcommentVo(int cnum, int num, String email, String content, Date regdate, int ref, int lev, int step) {
		super();
		this.cnum = cnum;
		this.num = num;
		this.email = email;
		this.content = content;
		this.regdate = regdate;
		this.ref = ref;
		this.lev = lev;
		this.step = step;
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

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getLev() {
		return lev;
	}

	public void setLev(int lev) {
		this.lev = lev;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

}
