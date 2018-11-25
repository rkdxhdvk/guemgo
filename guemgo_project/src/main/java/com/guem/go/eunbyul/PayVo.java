package com.guem.go.eunbyul;

import java.sql.Date;

public class PayVo {
	public String email;
	public String payoption;
	public Date paydate;
	public int paymoney;
	
	public PayVo() {}

	public PayVo(String email, String payoption, Date paydate, int paymoney) {
		super();
		this.email = email;
		this.payoption = payoption;
		this.paydate = paydate;
		this.paymoney = paymoney;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPayoption() {
		return payoption;
	}

	public void setPayoption(String payoption) {
		this.payoption = payoption;
	}

	public Date getPaydate() {
		return paydate;
	}

	public void setPaydate(Date paydate) {
		this.paydate = paydate;
	}

	public int getPaymoney() {
		return paymoney;
	}

	public void setPaymoney(int paymoney) {
		this.paymoney = paymoney;
	}

	
	
}
