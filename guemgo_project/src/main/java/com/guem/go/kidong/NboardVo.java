package com.guem.go.kidong;

import java.sql.Date;

public class NboardVo {
	private int num;
	private String title;
	private String content;
	private Date regdate;
	private String email;
	private int hit;
	private int comments;
	private String sort;

	public NboardVo() {
	}

	public NboardVo(int num, String title, String content, Date regdate, String email, int hit, int comments,
			String sort) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.email = email;
		this.hit = hit;
		this.comments = comments;
		this.sort = sort;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public int getComments() {
		return comments;
	}

	public void setComments(int comments) {
		this.comments = comments;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
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

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	@Override
	public String toString() {
		return "NboardVo [num=" + num + ", title=" + title + ", content=" + content + ", regdate=" + regdate
				+ ", email=" + email + ", hit=" + hit + "]";
	}

}
