package com.guem.go.minsu;

public class Sche_detailVo {
	private int schedetailNum;
	private int scheduleNum;
	private String memo;
	private String sDate;
	private String eDate;
	private int attendance;
	private String leturename;
	
	public Sche_detailVo() {
		// TODO Auto-generated constructor stub
	}

	public Sche_detailVo(int schedetailNum, int scheduleNum, String memo, String sDate, String eDate, int attendance, String leturename) {
		super();
		this.schedetailNum = schedetailNum;
		this.scheduleNum = scheduleNum;
		this.memo = memo;
		this.sDate = sDate;
		this.eDate = eDate;
		this.attendance = attendance;
		this.leturename = leturename;
	}

	public int getSchedetailNum() {
		return schedetailNum;
	}

	public void setSchedetailNum(int schedetailNum) {
		this.schedetailNum = schedetailNum;
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

	public String getLecturename() {
		return leturename;
	}

	public void setLecturename(String leturename) {
		this.leturename = leturename;
	}
	
}
