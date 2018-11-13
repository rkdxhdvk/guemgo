package com.guem.go.eunbyul;

public class CatemVo {
	public int 	mnum;
	public String mname;
	public int lnum;
	
	public CatemVo() {}

	public CatemVo(int mnum, String mname, int lnum) {
		super();
		this.mnum = mnum;
		this.mname = mname;
		this.lnum = lnum;
	}

	public int getMnum() {
		return mnum;
	}

	public void setMnum(int mnum) {
		this.mnum = mnum;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public int getLnum() {
		return lnum;
	}

	public void setLnum(int lnum) {
		this.lnum = lnum;
	}
	
	
}
