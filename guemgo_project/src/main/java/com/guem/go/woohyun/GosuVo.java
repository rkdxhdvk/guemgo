package com.guem.go.woohyun;

/*---------------------------------------
18-11-20	gosuDetail을 위해 vo 많이 수정
-----------------------------------------*/

public class GosuVo {
	// gosu 테이블 정보 
	private String email;
	private int go_num;
	private String intro;
	private String grade;
	private int employ;
	// gosu_image 테이블 정보 추가
	private String g_image;	// gosu_image 테이블의 이미지
	private String org_g_image; // 이미지 등록여부 확인
	// gosu_career 테이블 정보 추가
	private String license;
	private String org_license;
	// user 테이블 정보 추가
	private int m_num;
	private String name;
	private String career;
	private int point;
	private String u_image;	// users 테이블의 image 이미지
	// lecture(강의) 테이블 정보추가
	private int lecturenum;
	// gosu_area 테이블 정보 추가
	private String area;	
	
	public GosuVo() {}

	public GosuVo(String email, int go_num, String intro, String grade, int employ, String g_image, String license,
			int m_num, String name, String career, int point, String u_image, int lecturenum, String area) {
		super();
		this.email = email;
		this.go_num = go_num;
		this.intro = intro;
		this.grade = grade;
		this.employ = employ;
		this.g_image = g_image;
		this.license = license;
		this.m_num = m_num;
		this.name = name;
		this.career = career;
		this.point = point;
		this.u_image = u_image;
		this.lecturenum = lecturenum;
		this.area = area;
	}

		
	public String getOrg_g_image() {
		return org_g_image;
	}

	public void setOrg_g_image(String org_g_image) {
		this.org_g_image = org_g_image;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	
	public String getG_image() {
		return g_image;
	}

	public void setG_image(String g_image) {
		this.g_image = g_image;
	}

	public String getLicense() {
		return license;
	}

	public void setLicense(String license) {
		this.license = license;
	}
	
	public String getOrg_license() {
		return org_license;
	}

	public void setOrg_license(String org_license) {
		this.org_license = org_license;
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

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getU_image() {
		return u_image;
	}

	public void setU_image(String u_image) {
		this.u_image = u_image;
	}

	public int getLecturenum() {
		return lecturenum;
	}

	public void setLecturenum(int lecturenum) {
		this.lecturenum = lecturenum;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

}
