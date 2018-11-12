package com.guem.go.minsu;

public class EventVo {
	private String pointdate;
	private String email;
	
	public EventVo() {}

	public EventVo(String pointdate, String email) {
		super();
		this.pointdate = pointdate;
		this.email = email;
	}

	public String getPointdate() {
		return pointdate;
	}

	public void setPointdate(String pointdate) {
		this.pointdate = pointdate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
