package com.guem.go.kidong;

import java.sql.Date;

public class QboardVo {
	private int num;
	private String title;
	private String content;
	private Date regdate;
	private String email;
	private int grp;
	private int lev;
	private int step;
	private int hit;
	private String sort;
	private int flag;

	public QboardVo() {
	}

	public QboardVo(int num, String title, String content, Date regdate, String email, int grp, int lev, int step,
			int hit, String sort, int flag) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.email = email;
		this.grp = grp;
		this.lev = lev;
		this.step = step;
		this.hit = hit;
		this.sort = sort;
		this.flag = flag;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
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

	public int getGrp() {
		return grp;
	}

	public void setGrp(int grp) {
		this.grp = grp;
	}

	public int getLev() {
		return lev;
	}

	public void setLev(int lev) {
		this.lev = lev;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

}
