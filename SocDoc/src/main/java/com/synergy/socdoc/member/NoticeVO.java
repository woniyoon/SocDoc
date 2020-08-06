package com.synergy.socdoc.member;

public class NoticeVO {
	
	private int noticeSeq;
	private String subject;
	private String contents;
	private String regDate;
	private int hit;
	
	public NoticeVO() {}
	
	public NoticeVO(int noticeSeq, String subject, String contents, String regDate, int hit) {
		super();
		this.noticeSeq = noticeSeq;
		this.subject = subject;
		this.contents = contents;
		this.regDate = regDate;
		this.hit = hit;
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
	
	public int getHit() {
		return hit;
	}
	
	public void setHit(int hit) {
		this.hit = hit;
	}
	
}