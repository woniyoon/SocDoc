package com.synergy.socdoc.member;

public class HealthInfoVO {

	private int infoSeq;
	private String subject;
	private String content;
	private String regDate;
	private String img;

	private String preseq;
	private String presubject;
	private String nextseq;
	private String nextsubject;
	
	public HealthInfoVO() {}
	
	public HealthInfoVO(int infoSeq, String subject, String content, String regDate, String img) {
		super();
		this.infoSeq = infoSeq;
		this.subject = subject;
		this.content = content;
		this.regDate = regDate;
		this.img = img;
	}

	public int getInfoSeq() {
		return infoSeq;
	}
	
	public void setInfoSeq(int infoSeq) {
		this.infoSeq = infoSeq;
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
	
	public String getImg() {
		return img;
	}
	
	public void setImg(String img) {
		this.img = img;
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
