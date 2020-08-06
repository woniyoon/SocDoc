package com.synergy.socdoc.member;

public class HealthInfoVO {

	private int infoSeq;
	private String subject;
	private String contents;
	private String regDate;
	private String img;
	
	public HealthInfoVO() {}
	
	public HealthInfoVO(int infoSeq, String subject, String contents, String regDate, String img) {
		super();
		this.infoSeq = infoSeq;
		this.subject = subject;
		this.contents = contents;
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
