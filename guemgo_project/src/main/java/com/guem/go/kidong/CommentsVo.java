package com.guem.go.kidong;

import java.sql.Date;
import java.util.List;

public class CommentsVo {
	private int cnum;
	private String email;
	private String content;
	private Date regdate;
	private List<NreplyVo> comments;

	public CommentsVo() {}

	public CommentsVo(int cnum, String email, String content, Date regdate, List<NreplyVo> comments) {
		super();
		this.cnum = cnum;
		this.email = email;
		this.content = content;
		this.regdate = regdate;
		this.comments = comments;
	}

	public int getCnum() {
		return cnum;
	}

	public void setCnum(int cnum) {
		this.cnum = cnum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public List<NreplyVo> getComments() {
		return comments;
	}

	public void setComments(List<NreplyVo> comments) {
		this.comments = comments;
	}

}
