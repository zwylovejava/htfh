package com.boot.pojo;

import java.util.Date;
import java.util.List;

public class Order {
	private String orderId; //订单ID
	private String receiveId; //收货地址ID
	private String userId; //用户ID
	private Date orderTime; //下单时间
	private Double money; //订单金额
	private Integer state; //订单状态，'1已支付 0未支付'
	private Integer confirm; //收货状态，'1已收货 0 为收货'
	private Integer delivery; //配送状态，'1正在配送 0 未收货'
	private List<OrderItem> oiList; //订单条目列表
	//==========非数据库字段=============
	private Address address;
	
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	//==========非数据库字段=============
	public List<OrderItem> getOiList() {
		return oiList;
	}
	public void setOiList(List<OrderItem> oiList) {
		this.oiList = oiList;
	}
	public Integer getDelivery() {
		return delivery;
	}
	public void setDelivery(Integer delivery) {
		this.delivery = delivery;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
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
	public Date getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}
	public Double getMoney() {
		return money;
	}
	public void setMoney(Double money) {
		this.money = money;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Integer getConfirm() {
		return confirm;
	}
	public void setConfirm(Integer confirm) {
		this.confirm = confirm;
	}
	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", receiveId=" + receiveId + ", userId=" + userId + ", orderTime="
				+ orderTime + ", money=" + money + ", state=" + state + ", confirm=" + confirm + ", delivery="
				+ delivery + ", oiList=" + oiList + "]";
	}
}
