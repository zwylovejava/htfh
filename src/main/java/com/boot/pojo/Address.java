package com.boot.pojo;

public class Address {
	
	private String receiveId; //收货地址ID
	private String userId; //用户ID
	private String receiveP; //收货人名称
	private String area; //所在地区
	private String street; //街道
	private String zcode; //邮编
	private String phone; //手机号码
	private String tel; //固话
	private Integer addr; //地址状态，1为默认，0为备选
	
	public String getReceiveId() {
		return receiveId;
	}
	public void setReceiveId(String receiveId) {
		this.receiveId = receiveId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getReceiveP() {
		return receiveP;
	}
	public void setReceiveP(String receiveP) {
		this.receiveP = receiveP;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getZcode() {
		return zcode;
	}
	public void setZcode(String zcode) {
		this.zcode = zcode;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Integer getAddr() {
		return addr;
	}
	public void setAddr(Integer addr) {
		this.addr = addr;
	}
	
}
