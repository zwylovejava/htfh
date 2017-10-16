package com.boot.pojo;

import java.util.List;

public class Page<T> {
	private Integer currentPage=1;
	private Integer perpage=10;
	private Integer records;
	private Integer pages;
	private List<T> proudctList;
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public Integer getPerpage() {
		return perpage;
	}
	public void setPerpage(Integer perpage) {
		this.perpage = perpage;
	}
	public Integer getRecords() {
		return records;
	}
	public void setRecords(Integer records) {
		this.records = records;
	}
	public Integer getPages() {
		return records%perpage==0?(records/perpage):(records/perpage+1);
	}
	public void setPages(Integer pages) {
		this.pages = pages;
	}
	public List<T> getProudctList() {
		return proudctList;
	}
	public void setProudctList(List<T> proudctList) {
		this.proudctList = proudctList;
	}
	
	
	

}
