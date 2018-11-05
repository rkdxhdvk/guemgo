package com.guem.go.eunbyul;

public class CatemVo {
	public int 	m_num;
	public String m_name;
	public int l_num;
	
	public CatemVo() {}

	public CatemVo(int m_num, String m_name, int l_num) {
		super();
		this.m_num = m_num;
		this.m_name = m_name;
		this.l_num = l_num;
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

	public int getL_num() {
		return l_num;
	}

	public void setL_num(int l_num) {
		this.l_num = l_num;
	}
	
	
}
