package com.synergy.socdoc.member;

public class NoticeVO {
	
	private int noticeSeq;
	private String subject;
	private String content;
	private String regDate;
	private int hit;
	
	private String preseq;
	private String presubject;
	private String nextseq;
	private String nextsubject;
	
	public NoticeVO() {}
	
	public NoticeVO(int noticeSeq, String subject, String content, String regDate, int hit) {
		super();
		this.noticeSeq = noticeSeq;
		this.subject = subject;
		this.content = content;
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
	
	public String getcontent() {
		return content;
	}
	
	public void setcontent(String content) {
		this.content = content;
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

	public String getPreseq() {
		return preseq;
	}

	public void setPreseq(String preseq) {
		this.preseq = preseq;
	}

	public String getPresubject() {
		return presubject;
	}

	public void setPresubject(String presubject) {
		this.presubject = presubject;
	}

	public String getNextseq() {
		return nextseq;
	}

	public void setNextseq(String nextseq) {
		this.nextseq = nextseq;
	}

	public String getNextsubject() {
		return nextsubject;
	}

	public void setNextsubject(String nextsubject) {
		this.nextsubject = nextsubject;
	}
	
}
