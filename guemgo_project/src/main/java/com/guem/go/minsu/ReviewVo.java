package com.guem.go.minsu;

import java.util.Date;

public class ReviewVo {
	private int reviewNum;
	private String email;
	private String title;
	private String content;
	private int hit;
	private int flag;
	private int star;
	private String other;
	private Date regdate;
	private int comments;
	private String img;
	
	public ReviewVo() {}

	public ReviewVo(int reviewNum, String email, String title, String content, int hit, int flag, int star,
			String other, Date regdate, int comments, String img) {
		super();
		this.reviewNum = reviewNum;
		this.email = email;
		this.title = title;
		this.content = content;
		this.hit = hit;
		this.flag = flag;
		this.star = star;
		this.other = other;
		this.regdate = regdate;
		this.comments = comments;
		this.img = img;
	}

	public int getReviewNum() {
		return reviewNum;
	}

	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
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

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getComments() {
		return comments;
	}

	public void setComments(int comments) {
		this.comments = comments;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
}
