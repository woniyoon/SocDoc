package com.synergy.socdoc.member;

public class HpReviewVO {

	private int hpReviewSeq;
	private String userid;
	private int hpSeq;
	private String content;
	private String regDate;
	private int rating;
	// 병원의 평균 평점
	private int avgRating;
	
	private String hpName;
	
	public HpReviewVO() {}

	public HpReviewVO(int hpReviewSeq, String userid, int hpSeq, String content, String regDate, int rating, int avgRating, String hpName) {
		super();
		this.hpReviewSeq = hpReviewSeq;
		this.userid = userid;
		this.hpSeq = hpSeq;
		this.content = content;
		this.regDate = regDate;
		this.rating = rating;
		this.avgRating = avgRating;
		this.hpName = hpName;
	}

	public int getHpReviewSeq() {
		return hpReviewSeq;
	}

	public void setHpReviewSeq(int hpReviewSeq) {
		this.hpReviewSeq = hpReviewSeq;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getHpSeq() {
		return hpSeq;
	}

	public void setHpSeq(int hpSeq) {
		this.hpSeq = hpSeq;
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

	public int getAvgRating() {
		return avgRating;
	}

	public void setAvgRating(int avgRating) {
		this.avgRating = avgRating;
	}

	public String getHpName() {
		return hpName;
	}

	public void setHpName(String hpName) {
		this.hpName = hpName;
	}
	

}
