package com.guem.go.woohyun;

import java.util.Date;
/*
 ------------------------
	2018-11-13	윤우현 생성
 ------------------------	
*/
public class PointVo {
	private int num;
	private String email;
	private String pointdate;
	private int division;
	private String detail;
	private int dpoint;
	private int lpoint;
	private int point;
	
	//pay 테이블 내용
	public String payoption;
	public Date paydate;
	public int paymoney;
	
	public PointVo() {}
	
	

	public PointVo(int num, String email, String pointdate, int division, String detail, int dpoint, int lpoint) {
		super();
		this.num = num;
		this.email = email;
		this.pointdate = pointdate;
		this.division = division;
		this.detail = detail;
		this.dpoint = dpoint;
		this.lpoint = lpoint;
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

	public String getPointdate() {
		return pointdate;
	}

	public void setPointdate(String pointdate) {
		this.pointdate = pointdate;
	}

	public int getDivision() {
		return division;
	}

	public void setDivision(int division) {
		this.division = division;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public int getDpoint() {
		return dpoint;
	}

	public void setDpoint(int dpoint) {
		this.dpoint = dpoint;
	}

	public int getLpoint() {
		return lpoint;
	}

	public void setLpoint(int lpoint) {
		this.lpoint = lpoint;
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



	public int getPoint() {
		return point;
	}



	public void setPoint(int point) {
		this.point = point;
	}
	
	
	
}
