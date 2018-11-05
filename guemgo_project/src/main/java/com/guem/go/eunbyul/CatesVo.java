package com.guem.go.eunbyul;

public class CatesVo {
	public int	s_num;
	public String s_name;
	public int m_num;

	
	public CatesVo() {}


	public CatesVo(int s_num, String s_name, int m_num) {
		super();
		this.s_num = s_num;
		this.s_name = s_name;
		this.m_num = m_num;
	}


	public int getS_num() {
		return s_num;
	}


	public void setS_num(int s_num) {
		this.s_num = s_num;
	}


	public String getS_name() {
		return s_name;
	}


	public void setS_name(String s_name) {
		this.s_name = s_name;
	}


	public int getM_num() {
		return m_num;
	}


	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	
	
	
	
}
