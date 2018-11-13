package com.guem.go.eunbyul;

public class CatesVo {
	public int	snum;
	public String sname;
	public int mnum;

	
	public CatesVo() {}


	public CatesVo(int snum, String sname, int mnum) {
		super();
		this.snum = snum;
		this.sname = sname;
		this.mnum = mnum;
	}


	public int getSnum() {
		return snum;
	}


	public void setSnum(int snum) {
		this.snum = snum;
	}


	public String getSname() {
		return sname;
	}


	public void setSname(String sname) {
		this.sname = sname;
	}


	public int getMnum() {
		return mnum;
	}


	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	
	
	
	
}
