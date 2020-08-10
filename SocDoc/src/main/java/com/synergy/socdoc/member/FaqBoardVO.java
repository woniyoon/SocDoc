package com.synergy.socdoc.member;

public class FaqBoardVO {

	private int faqSeq;
	private String question;
	private String answer;
	
	public FaqBoardVO() {}

	public FaqBoardVO(int faqSeq, String question, String answer) {
		super();
		this.faqSeq = faqSeq;
		this.question = question;
		this.answer = answer;
	}

	public int getFaqSeq() {
		return faqSeq;
	}

	public void setFaqSeq(int faqSeq) {
		this.faqSeq = faqSeq;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
}
