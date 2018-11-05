package com.guem.go.woohyun;

public class GosuVo {
	private String profile;
	private String certificate;
	private String career;
	private String email;
	
	public GosuVo() {}

	public GosuVo(String profile, String certificate, String career, String email) {
		super();
		this.profile = profile;
		this.certificate = certificate;
		this.career = career;
		this.email = email;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getCertificate() {
		return certificate;
	}

	public void setCertificate(String certificate) {
		this.certificate = certificate;
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

	
	
	
}
