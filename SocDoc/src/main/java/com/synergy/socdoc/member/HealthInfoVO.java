package com.synergy.socdoc.member;

public class HealthInfoVO {

	private int noticeSeq;
	private String subject;
	private String contents;
	private String regDate;
	private String img;
	
	public HealthInfoVO() {}
	
	public HealthInfoVO(int noticeSeq, String subject, String contents, String regDate, String img) {
		super();
		this.noticeSeq = noticeSeq;
		this.subject = subject;
		this.contents = contents;
		this.regDate = regDate;
		this.img = img;
	}

	public int getNoticeSeq() {
		return noticeSeq;
	}
	
	public void setNoticeSeq(int noticeSeq) {
		this.noticeSeq = noticeSeq;
	}
	
	public String getSubject() {
		return subject;
	}
	
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	public String getContents() {
		return contents;
	}
	
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	public String getRegDate() {
		return regDate;
	}
	
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	public String getImg() {
		return img;
	}
	
	public void setImg(String img) {
		this.img = img;
	}
	
}
