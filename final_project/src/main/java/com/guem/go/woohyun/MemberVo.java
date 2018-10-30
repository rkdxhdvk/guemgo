package com.guem.go.woohyun;

import java.sql.Date;

public class MemberVo {
	private String email;
	private int mdiv;
	private String pwd;
	private String name;
	private int mnum;
	private int mlev;
	private String mimg;
	private int point;
	private Date regdate;
	
	public MemberVo() {}

	public MemberVo(String email, int mdiv, String pwd, String name, int mnum, int mlev, String mimg, int point,
			Date regdate) {
		super();
		this.email = email;
		this.mdiv = mdiv;
		this.pwd = pwd;
		this.name = name;
		this.mnum = mnum;
		this.mlev = mlev;
		this.mimg = mimg;
		this.point = point;
		this.regdate = regdate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getMdiv() {
		return mdiv;
	}

	public void setMdiv(int mdiv) {
		this.mdiv = mdiv;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getMnum() {
		return mnum;
	}

	public void setMnum(int mnum) {
		this.mnum = mnum;
	}

	public int getMlev() {
		return mlev;
	}

	public void setMlev(int mlev) {
		this.mlev = mlev;
	}

	public String getMimg() {
		return mimg;
	}

	public void setMimg(String mimg) {
		this.mimg = mimg;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

}
