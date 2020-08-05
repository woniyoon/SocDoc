package com.synergy.socdoc.member;

public class HpInfoVO {

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
	
	
	public HpInfoVO() {
		
	}	
	
	public HpInfoVO(String dept, String hpName, String address, String phone, String info,
			double latitude, double longitude, int open, int close, String mainImg, String subImg1, String subImg2) {
		super();
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

	public String getphone() {
		return phone;
	}

	public void setphone(String phone) {
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
	
	
}
