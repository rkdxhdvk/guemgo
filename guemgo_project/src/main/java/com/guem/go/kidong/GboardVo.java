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
	private String orgfilename;
	private String savefilename;
	private long filesize;

	public GboardVo() {
	}

	public GboardVo(int num, String email, String title, String content, int hit, int recomm, int comments,
			Date regdate, String orgfilename, String savefilename, long filesize) {
		super();
		this.num = num;
		this.email = email;
		this.title = title;
		this.content = content;
		this.hit = hit;
		this.recomm = recomm;
		this.comments = comments;
		this.regdate = regdate;
		this.orgfilename = orgfilename;
		this.savefilename = savefilename;
		this.filesize = filesize;
	}

	public String getOrgfilename() {
		return orgfilename;
	}

	public void setOrgfilename(String orgfilename) {
		this.orgfilename = orgfilename;
	}

	public String getSavefilename() {
		return savefilename;
	}

	public void setSavefilename(String savefilename) {
		this.savefilename = savefilename;
	}

	public long getFilesize() {
		return filesize;
	}

	public void setFilesize(long filesize) {
		this.filesize = filesize;
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
