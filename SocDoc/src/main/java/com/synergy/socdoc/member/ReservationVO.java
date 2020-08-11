package com.synergy.socdoc.member;

public class ReservationVO {

	private int reservSeq;
	private String userid;
	private int hpSeq;
	private int hourSeq;
	private String visitDate;
	private int status;
	
	public ReservationVO() {}
	
	public ReservationVO(int reservSeq, String userid, int hpSeq, int hourSeq, String visitDate, int status) {
		super();
		this.reservSeq = reservSeq;
		this.userid = userid;
		this.hpSeq = hpSeq;
		this.hourSeq = hourSeq;
		this.visitDate = visitDate;
		this.status = status;
	}

	public int getReservSeq() {
		return reservSeq;
	}

	public void setReservSeq(int reservSeq) {
		this.reservSeq = reservSeq;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getHpSeq() {
		return hpSeq;
	}

	public void setHpSeq(int hpSeq) {
		this.hpSeq = hpSeq;
	}

	public int getHourSeq() {
		return hourSeq;
	}

	public void setHourSeq(int hourSeq) {
		this.hourSeq = hourSeq;
	}

	public String getVisitDate() {
		return visitDate;
	}

	public void setVisitDate(String visitDate) {
		this.visitDate = visitDate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	
	
	
}
