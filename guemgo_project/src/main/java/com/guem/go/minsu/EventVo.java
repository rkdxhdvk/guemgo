package com.guem.go.minsu;

public class EventVo {
	private String att;
	private String email;
	
	public EventVo() {}

	public EventVo(String att, String email) {
		super();
		this.att = att;
		this.email = email;
	}

	public String getAtt() {
		return att;
	}

	public void setAtt(String att) {
		this.att = att;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
