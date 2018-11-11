package com.guem.go.minsu;

import java.util.Date;

public class Re_commentVo {
	private int commentNum;
	private int reviewNum;
	private String content;
	private String writer;
	private Date regdate;
	
	public Re_commentVo() {}

	public Re_commentVo(int commentNum, int reviewNum, String content, String writer, Date regdate) {
		super();
		this.commentNum = commentNum;
		this.reviewNum = reviewNum;
		this.content = content;
		this.writer = writer;
		this.regdate = regdate;
	}

	public int getCommentNum() {
		return commentNum;
	}

	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}

	public int getReviewNum() {
		return reviewNum;
	}

	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}
