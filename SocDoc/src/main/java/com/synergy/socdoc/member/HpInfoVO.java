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
	private String mainImg;
	private String subImg1;
	private String subImg2;
	// 신청 상태 (1:신청, 2:반려, 3:수정신청, 4:완료)
	private int status;
	private String submitId;
	private String uploadDate;
	
	private String fileNameMain; // WAS에 저장될 파일명, 날짜 + 나노초.png (예)20200725.....png)
	private String orgFileNameMain; // 진짜 파일명(예)강아지.png)
	private String fileSizeMain; // 파일크기
	
	private String fileNameSub1; // WAS에 저장될 파일명, 날짜 + 나노초.png (예)20200725.....png)
	private String orgFileNameSub1; // 진짜 파일명(예)강아지.png)
	private String fileSizeSub1; // 파일크기
	
	private String fileNameSub2; // WAS에 저장될 파일명, 날짜 + 나노초.png (예)20200725.....png)
	private String orgFileNameSub2; // 진짜 파일명(예)강아지.png)
	private String fileSizeSub2; // 파일크기

	private MultipartFile[] attachMain;
//	private MultipartFile attachSub1;
//	private MultipartFile attachSub2;
	
	
	public HpInfoVO() {
		
	}	
	
	public HpInfoVO(String hpSeq, String dept, String hpName, String address, String phone, String info,
			double latitude, double longitude, int open, int close, String mainImg, String subImg1, String subImg2, int status, String submitId, String uploadDate) {
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

	public String getFileNameMain() {
		return fileNameMain;
	}

	public void setFileNameMain(String fileNameMain) {
		this.fileNameMain = fileNameMain;
	}

	public String getOrgFileNameMain() {
		return orgFileNameMain;
	}

	public void setOrgFileNameMain(String orgFileNameMain) {
		this.orgFileNameMain = orgFileNameMain;
	}

	public String getFileSizeMain() {
		return fileSizeMain;
	}

	public void setFileSizeMain(String fileSizeMain) {
		this.fileSizeMain = fileSizeMain;
	}

	public String getFileNameSub1() {
		return fileNameSub1;
	}

	public void setFileNameSub1(String fileNameSub1) {
		this.fileNameSub1 = fileNameSub1;
	}

	public String getOrgFileNameSub1() {
		return orgFileNameSub1;
	}

	public void setOrgFileNameSub1(String orgFileNameSub1) {
		this.orgFileNameSub1 = orgFileNameSub1;
	}

	public String getFileSizeSub1() {
		return fileSizeSub1;
	}

	public void setFileSizeSub1(String fileSizeSub1) {
		this.fileSizeSub1 = fileSizeSub1;
	}

	public String getFileNameSub2() {
		return fileNameSub2;
	}

	public void setFileNameSub2(String fileNameSub2) {
		this.fileNameSub2 = fileNameSub2;
	}

	public String getOrgFileNameSub2() {
		return orgFileNameSub2;
	}

	public void setOrgFileNameSub2(String orgFileNameSub2) {
		this.orgFileNameSub2 = orgFileNameSub2;
	}

	public String getFileSizeSub2() {
		return fileSizeSub2;
	}

	public void setFileSizeSub2(String fileSizeSub2) {
		this.fileSizeSub2 = fileSizeSub2;
	}

	public MultipartFile[] getAttachMain() {
		return attachMain;
	}

	public void setAttachMain(MultipartFile[] attachMain) {
		this.attachMain = attachMain;
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
