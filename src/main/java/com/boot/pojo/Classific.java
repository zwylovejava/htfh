package com.boot.pojo;

import java.util.List;

public class Classific {
	private String classificId;
	private String classificName;
	private List<Product> productList;
	public String getClassificId() {
		return classificId;
	}
	public void setClassificId(String classificId) {
		this.classificId = classificId;
	}
	public String getClassificName() {
		return classificName;
	}
	public void setClassificName(String classificName) {
		this.classificName = classificName;
	}
	public List<Product> getProductList() {
		return productList;
	}
	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}
	
	

}
