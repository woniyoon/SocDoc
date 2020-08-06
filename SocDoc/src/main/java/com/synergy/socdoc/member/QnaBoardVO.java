package com.synergy.socdoc.member;

public class QnaBoardVO {

	private int qnaSeq;
	private String userid;
	private String subject;
	private String content;
	private String regDate;
	private int status;
	
	
	public QnaBoardVO() {}
	
	public QnaBoardVO(int qnaSeq, String userid, String subject, String content, String regDate, int status) {
		this.qnaSeq = qnaSeq;
		this.userid = userid;
		this.subject = subject;
		this.content = content;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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
