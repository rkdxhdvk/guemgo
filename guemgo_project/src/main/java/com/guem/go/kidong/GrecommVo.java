package com.guem.go.kidong;

public class GrecommVo {
	private int num;
	private String email;
	private int bnum;
	
	public GrecommVo() {}

	public GrecommVo(int num, String email, int bnum) {
		super();
		this.num = num;
		this.email = email;
		this.bnum = bnum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	
	
}
