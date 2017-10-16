package com.boot.pojo;


public class OrderItem {
	private String orderId; //订单ID
	private String productId; //商品ID
	private Integer buyNum; //购买数量
	private String assess; //评价
	private Product product; //商品
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public Integer getBuyNum() {
		return buyNum;
	}
	public void setBuyNum(Integer buyNum) {
		this.buyNum = buyNum;
	}
	public String getAssess() {
		return assess;
	}
	public void setAssess(String assess) {
		this.assess = assess;
	}
	@Override
	public String toString() {
		return "OrderItem [orderId=" + orderId + ", productId=" + productId + ", buyNum=" + buyNum + ", assess="
				+ assess + ", product=" + product + "]";
	}
}
