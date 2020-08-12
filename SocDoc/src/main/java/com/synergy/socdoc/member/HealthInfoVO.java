package com.synergy.socdoc.member;

import org.springframework.web.multipart.MultipartFile;

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
	
	private MultipartFile attach; // 내가 임의로 만든 파일첨부
	private String imgName;
	
	public HealthInfoVO() {}
	
	public HealthInfoVO(int infoSeq, String subject, String content, String regDate, String img, String imgName) {
		super();
		this.infoSeq = infoSeq;
		this.subject = subject;
		this.content = content;
		this.regDate = regDate;
		this.img = img;
		this.imgName = imgName;
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

	public MultipartFile getAttach() {
		return attach;
	}

	public void setAttach(MultipartFile attach) {
		this.attach = attach;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	
	
}
