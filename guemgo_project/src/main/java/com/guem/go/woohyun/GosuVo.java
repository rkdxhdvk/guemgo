package com.guem.go.woohyun;

public class GosuVo {
	private int go_num;
	private String intro;
	private String license;
	private String career;
	private String email; 
	private String grade;
	private int employ;
	private String image;
	// user 테이블 정보 추가
	private int m_num;
	private String name;
	private int point;
	
	public GosuVo() {}

	public GosuVo(int go_num, String intro, String license, String career, String email, String grade, int employ,
			String image, int m_num, String name, int point) {
		super();
		this.go_num = go_num;
		this.intro = intro;
		this.license = license;
		this.career = career;
		this.email = email;
		this.grade = grade;
		this.employ = employ;
		this.image = image;
		this.m_num = m_num;
		this.name = name;
		this.point = point;
	}

	public int getGo_num() {
		return go_num;
	}

	public void setGo_num(int go_num) {
		this.go_num = go_num;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getLicense() {
		return license;
	}

	public void setLicense(String license) {
		this.license = license;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public int getEmploy() {
		return employ;
	}

	public void setEmploy(int employ) {
		this.employ = employ;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	
	
	
}
