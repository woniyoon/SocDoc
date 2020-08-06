package com.synergy.socdoc.member;

public class QnAVO {

	private int qnaSeq;
	private String userid;
	private String subject;
	private String contents;
	private String regDate;
	private int status;
	
	public QnAVO() {}
	
	public QnAVO(int qnaSeq, String userid, String subject, String contents, String regDate, int status) {
		super();
		this.qnaSeq = qnaSeq;
		this.userid = userid;
		this.subject = subject;
		this.contents = contents;
		this.regDate = regDate;
		this.status = status;
	}

	public int getQnaSeq() {
		return qnaSeq;
	}
	
	public void setQnaSeq(int qnaSeq) {
		this.qnaSeq = qnaSeq;
	}
	
	public String getUserid() {
		return userid;
	}
	
	public void setUserid(String userid) {
		this.userid = userid;
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
	
	public int getStatus() {
		return status;
	}
	
	public void setStatus(int status) {
		this.status = status;
	}
	
}
