package com.synergy.socdoc.member;

public class QnaBoardVO {

	private int qnaSeq;
	private String userid;
	private String subject;
	private String content;
	private String regDate;
	private int status;
	
	
	private String previousseq;      // 이전글번호
	private String previoussubject;  // 이전글제목
	private String nextseq;          // 다음글번호
	private String nextsubject;      // 다음글제목	

	private String groupno; 
	private String fk_seq;         
	private String depthno;     
	
	
	public QnaBoardVO() {}
	


	public QnaBoardVO(int qnaSeq, String userid, String subject, String content, String regDate, int status,
			String previousseq, String previoussubject, String nextseq, String nextsubject, String groupno,
			String fk_seq, String depthno) {
		this.qnaSeq = qnaSeq;
		this.userid = userid;
		this.subject = subject;
		this.content = content;
		this.regDate = regDate;
		this.status = status;
		this.previousseq = previousseq;
		this.previoussubject = previoussubject;
		this.nextseq = nextseq;
		this.nextsubject = nextsubject;
		this.groupno = groupno;
		this.fk_seq = fk_seq;
		this.depthno = depthno;
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



	public String getPreviousseq() {
		return previousseq;
	}



	public void setPreviousseq(String previousseq) {
		this.previousseq = previousseq;
	}



	public String getPrevioussubject() {
		return previoussubject;
	}



	public void setPrevioussubject(String previoussubject) {
		this.previoussubject = previoussubject;
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



	public String getGroupno() {
		return groupno;
	}



	public void setGroupno(String groupno) {
		this.groupno = groupno;
	}



	public String getFk_seq() {
		return fk_seq;
	}



	public void setFk_seq(String fk_seq) {
		this.fk_seq = fk_seq;
	}



	public String getDepthno() {
		return depthno;
	}



	public void setDepthno(String depthno) {
		this.depthno = depthno;
	}
	
	
	
}
