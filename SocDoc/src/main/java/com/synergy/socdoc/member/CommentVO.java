package com.synergy.socdoc.member;

public class CommentVO {
	
	private String commentSeq;
	private String content;
	private String regDate;
	private String parentSeq;
	
	public CommentVO() {}
	
	public CommentVO(String commentSeq, String content, String regDate, String parentSeq) {
		super();
		this.commentSeq = commentSeq;
		this.content = content;
		this.regDate = regDate;
		this.parentSeq = parentSeq;
	}

	public String getCommentSeq() {
		return commentSeq;
	}

	public void setCommentSeq(String commentSeq) {
		this.commentSeq = commentSeq;
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

	public String getParentSeq() {
		return parentSeq;
	}

	public void setParentSeq(String parentSeq) {
		this.parentSeq = parentSeq;
	}
	

}
