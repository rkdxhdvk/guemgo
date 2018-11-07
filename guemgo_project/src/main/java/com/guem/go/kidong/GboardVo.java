package com.guem.go.kidong;

import java.sql.Date;

public class GboardVo {
	private int num;
	private String email;
	private String title;
	private String content;
	private int hit;
	private int recomm;
	private int comments;
	private Date regdate;
	
	public GboardVo() {}

	public GboardVo(int num, String email, String title, String content, int hit, int recomm, int comments,
			Date regdate) {
		super();
		this.num = num;
		this.email = email;
		this.title = title;
		this.content = content;
		this.hit = hit;
		this.recomm = recomm;
		this.comments = comments;
		this.regdate = regdate;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getRecomm() {
		return recomm;
	}

	public void setRecomm(int recomm) {
		this.recomm = recomm;
	}

	public int getComments() {
		return comments;
	}

	public void setComments(int comments) {
		this.comments = comments;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}
