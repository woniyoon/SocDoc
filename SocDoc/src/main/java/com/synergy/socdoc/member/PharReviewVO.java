package com.synergy.socdoc.member;

public class PharReviewVO {

	private int phReviewSeq;
	private int pharmSeq;
	private String userid;
	private String content;
	private String regDate;
	private int rating;
	
	private String pharName;
	
	public PharReviewVO() {}

	public PharReviewVO(int phReviewSeq, int pharmSeq, String userid, String content, String regDate, int rating, String pharName) {
		super();
		this.phReviewSeq = phReviewSeq;
		this.pharmSeq = pharmSeq;
		this.userid = userid;
		this.content = content;
		this.regDate = regDate;
		this.rating = rating;
		this.pharName = pharName;
	}

	public int getPhReviewSeq() {
		return phReviewSeq;
	}

	public void setPhReviewSeq(int phReviewSeq) {
		this.phReviewSeq = phReviewSeq;
	}

	public int getPharmSeq() {
		return pharmSeq;
	}

	public void setPharmSeq(int pharmSeq) {
		this.pharmSeq = pharmSeq;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
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

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getPharName() {
		return pharName;
	}

	public void setPharName(String pharName) {
		this.pharName = pharName;
	}
	
	
}
