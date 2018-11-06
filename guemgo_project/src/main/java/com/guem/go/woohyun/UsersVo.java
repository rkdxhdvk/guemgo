package com.guem.go.woohyun;

import java.sql.Date;

public class UsersVo {
	private String email;
	private int flag;
	private String pwd;
	private String name;
	private int m_num;
	private String grade;
	private String image;
	private int point;
	private Date regdate;
	
	public UsersVo() {}

	public UsersVo(String email, int flag, String pwd, String name, int m_num, String grade, String image, int point,
			Date regdate) {
		super();
		this.email = email;
		this.flag = flag;
		this.pwd = pwd;
		this.name = name;
		this.m_num = m_num;
		this.grade = grade;
		this.image = image;
		this.point = point;
		this.regdate = regdate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
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

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
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
