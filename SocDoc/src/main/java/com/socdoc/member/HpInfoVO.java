package com.socdoc.member;

public class HpInfoVO {

	private String dept;
	private String hpName;
	private String address;
	private String addressDetail;
	private String tel;
	private String info;
	private double latitude;
	private double longitude;
	private int open;
	private int close;
	private String mainImg;
	private String subImg1;
	private String subImg2;
	
	
	public HpInfoVO() {
		
	}	
	
	public HpInfoVO(String dept, String hpName, String address, String addressDetail, String tel, String info,
			double latitude, double longitude, int open, int close, String mainImg, String subImg1, String subImg2) {
		super();
		this.dept = dept;
		this.hpName = hpName;
		this.address = address;
		this.addressDetail = addressDetail;
		this.tel = tel;
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

	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
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
	
	
}
