package com.guem.go.minsu;

public class Sche_detailVo {
	private int num;
	private int scheduleNum;
	private String memo;
	private String sDate;
	private String eDate;
	private int attendance;
	
	public Sche_detailVo() {
		// TODO Auto-generated constructor stub
	}

	public Sche_detailVo(int num, int scheduleNum, String memo, String sDate, String eDate, int attendance) {
		super();
		this.num = num;
		this.scheduleNum = scheduleNum;
		this.memo = memo;
		this.sDate = sDate;
		this.eDate = eDate;
		this.attendance = attendance;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getScheduleNum() {
		return scheduleNum;
	}

	public void setScheduleNum(int schedulenum) {
		this.scheduleNum = schedulenum;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getsDate() {
		return sDate;
	}

	public void setsDate(String sDate) {
		this.sDate = sDate;
	}

	public String geteDate() {
		return eDate;
	}

	public void seteDate(String eDate) {
		this.eDate = eDate;
	}

	public int getAttendance() {
		return attendance;
	}

	public void setAttendance(int attendance) {
		this.attendance = attendance;
	}
	
}
