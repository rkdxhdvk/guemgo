package com.guem.go.eunbyul;

public class CatelVo {
	public int 	lnum;
	public String lname;
	
	public CatelVo() {}

	public CatelVo(int lnum, String lname) {
		super();
		this.lnum = lnum;
		this.lname = lname;
	}

	public int getLnum() {
		return lnum;
	}

	public void setLnum(int lnum) {
		this.lnum = lnum;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}
	
	
}
