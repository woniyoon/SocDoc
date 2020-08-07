package com.synergy.socdoc.member;

public class MemberVO {

	private String userid;
	private String pwd;
	private String email;
	private String name;
	private String phone;
	private int height;
	private int weight;
	private String bloodType;
	private String allergy;
	private String history;
	private String medicine;
	private int memberSeq;
	private String registerDate;
	private int status;
	private String birthDate;
	
	public MemberVO() {}
	
	public MemberVO(String userid, String pwd, String email, String name, String phone, int height, int weight,
			String bloodType, String allergy, String history, String medicine, int memberSeq, String registerDate,
			int status, String birthDate) {
		super();
		this.userid = userid;
		this.pwd = pwd;
		this.email = email;
		this.name = name;
		this.phone = phone;
		this.height = height;
		this.weight = weight;
		this.bloodType = bloodType;
		this.allergy = allergy;
		this.history = history;
		this.medicine = medicine;
		this.memberSeq = memberSeq;
		this.registerDate = registerDate;
		this.status = status;
		this.birthDate = birthDate;
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

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public String getBloodType() {
		return bloodType;
	}

	public void setBloodType(String bloodType) {
		this.bloodType = bloodType;
	}

	public String getAllergy() {
		return allergy;
	}

	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}

	public String getHistory() {
		return history;
	}

	public void setHistory(String history) {
		this.history = history;
	}

	public String getMedicine() {
		return medicine;
	}

	public void setMedicine(String medicine) {
		this.medicine = medicine;
	}

	public int getMemberSeq() {
		return memberSeq;
	}

	public void setMemberSeq(int memberSeq) {
		this.memberSeq = memberSeq;
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
	
	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	
}
