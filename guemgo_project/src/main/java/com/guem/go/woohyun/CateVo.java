package com.guem.go.woohyun;

public class CateVo {
	private int l_num;
	private String l_name;
	private int m_num;
	private String m_name;
	
	
	public CateVo() {}

	public CateVo(int l_num, String l_name, int m_num, String m_name) {
		super();
		this.l_num = l_num;
		this.l_name = l_name;
		this.m_num = m_num;
		this.m_name = m_name;
	}

	
	public int getL_num() {
		return l_num;
	}

	public void setL_num(int l_num) {
		this.l_num = l_num;
	}

	public String getL_name() {
		return l_name;
	}

	public void setL_name(String l_name) {
		this.l_name = l_name;
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	
	
	
}
