package com.synergy.socdoc.member;

public class HpMemberVO {
	
	private String userid;
	private String pwd;
	private String email;
	private String name;
	private String phone;
	private int hpSeq;
	private String regId;
	private String registerDate;
	// 가입 상태
	private int status;
	// 상세정보 등록 상태
	private int infoStatus;
	private HpInfoVO hpinfo;
	
	
	public HpMemberVO() {}

	public HpMemberVO(String userid, String pwd, String email, String name, String phone, int hpSeq, String regId,
			String registerDate, int status, int infoStatus) {
		super();
		this.userid = userid;
		this.pwd = pwd;
		this.email = email;
		this.name = name;
		this.phone = phone;
		this.hpSeq = hpSeq;
		this.regId = regId;
		this.registerDate = registerDate;
		this.status = status;
		this.infoStatus = infoStatus;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getHpSeq() {
		return hpSeq;
	}

	public void setHpSeq(int hpSeq) {
		this.hpSeq = hpSeq;
	}

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}

	public String getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getInfoStatus() {
		return infoStatus;
	}

	public void setInfoStatus(int infoStatus) {
		this.infoStatus = infoStatus;
	}
	
}
