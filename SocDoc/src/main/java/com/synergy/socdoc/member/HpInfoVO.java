package com.synergy.socdoc.member;

import org.springframework.web.multipart.MultipartFile;

public class HpInfoVO {

	private String hpSeq;
	private String dept;
	private String hpName;
	private String address;
	private String phone;
	private String info;
	private double latitude;
	private double longitude;
	// 필요한지 모르겠음; 
	private int open;
	private int close;
	// WAS에 저장될 파일명, 날짜 + 나노초.png
	private String mainImg;
	private String subImg1;
	private String subImg2;
	// 신청 상태 (1:신청, 2:반려, 3:수정신청, 4:완료)
	private int status;
	private String submitId;
	private String uploadDate;
	
	private String orgMainImg; // 진짜 파일명(예)강아지.png)
	private String orgSubImg1; // 진짜 파일명(예)강아지.png)
	private String orgSubImg2; // 진짜 파일명(예)강아지.png)

	private MultipartFile[] attachMain;
	
	// 반려 사유
	private String reason;
	
	
	public HpInfoVO() {
		
	}	
	
	public HpInfoVO(String hpSeq, String dept, String hpName, String address, String phone, String info,
			double latitude, double longitude, int open, int close, String mainImg, String subImg1, String subImg2, int status, String submitId, String uploadDate, String reason) {
		super();
		this.hpSeq = hpSeq;
		this.dept = dept;
		this.hpName = hpName;
		this.address = address;
		this.phone = phone;
		this.info = info;
		this.latitude = latitude;
		this.longitude = longitude;
		this.open = open;
		this.close = close;
		this.mainImg = mainImg;
		this.subImg1 = subImg1;
		this.subImg2 = subImg2;
		this.status = status;
		this.submitId = submitId;
		this.uploadDate = uploadDate;
		this.reason = reason;
	}

	public String getHpSeq() {
		return hpSeq;
	}
	
	public void setHpSeq(String hpSeq) {
		this.hpSeq = hpSeq;
	}
	
	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getHpName() {
		return hpName;
	}

	public void setHpName(String hpName) {
		this.hpName = hpName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public int getOpen() {
		return open;
	}

	public void setOpen(int open) {
		this.open = open;
	}

	public int getClose() {
		return close;
	}

	public void setClose(int close) {
		this.close = close;
	}

	public String getMainImg() {
		return mainImg;
	}
                                                                                                                                                                                                                
	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
	}

	public String getSubImg1() {
		return subImg1;
	}

	public void setSubImg1(String subImg1) {
		this.subImg1 = subImg1;
	}

	public String getSubImg2() {
		return subImg2;
	}

	public void setSubImg2(String subImg2) {
		this.subImg2 = subImg2;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getSubmitId() {
		return submitId;
	}

	public void setSubmitId(String submitId) {
		this.submitId = submitId;
	}

	public String getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getOrgFileNameMain() {
		return orgMainImg;
	}

	public void setOrgFileNameMain(String orgFileNameMain) {
		this.orgMainImg = orgFileNameMain;
	}

	public String getOrgFileNameSub1() {
		return orgSubImg1;
	}

	public void setOrgFileNameSub1(String orgFileNameSub1) {
		this.orgSubImg1 = orgFileNameSub1;
	}

	public String getOrgFileNameSub2() {
		return orgSubImg2;
	}

	public void setOrgFileNameSub2(String orgFileNameSub2) {
		this.orgSubImg2 = orgFileNameSub2;
	}

	public MultipartFile[] getAttachMain() {
		return attachMain;
	}

	public void setAttachMain(MultipartFile[] attachMain) {
		this.attachMain = attachMain;
	}

	public String getOrgMainImg() {
		return orgMainImg;
	}

	public void setOrgMainImg(String orgMainImg) {
		this.orgMainImg = orgMainImg;
	}

	public String getOrgSubImg1() {
		return orgSubImg1;
	}

	public void setOrgSubImg1(String orgSubImg1) {
		this.orgSubImg1 = orgSubImg1;
	}

	public String getOrgSubImg2() {
		return orgSubImg2;
	}

	public void setOrgSubImg2(String orgSubImg2) {
		this.orgSubImg2 = orgSubImg2;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

//	public MultipartFile getAttachSub1() {
//		return attachSub1;
//	}
//
//	public void setAttachSub1(MultipartFile attachSub1) {
//		this.attachSub1 = attachSub1;
//	}
//
//	public MultipartFile getAttachSub2() {
//		return attachSub2;
//	}
//
//	public void setAttachSub2(MultipartFile attachSub2) {
//		this.attachSub2 = attachSub2;
//	}
	
}
