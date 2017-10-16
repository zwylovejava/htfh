package com.boot.service;

import java.util.List;

import com.boot.pojo.ClassAll;
import com.boot.pojo.Product;

public interface ProductService {

	List<Product> findAll();

	Product findProdInfoById(String productId);

	List<ClassAll> findAllClass();


	List<Product> findByPage(Integer perpage, Integer currentPage,Double minprice, 
			Double maxprice,String classificId,String searchName,Integer sort);


	Number findCountByKey(Double _min, Double _max, String classificId, String searchName);


	void addProduct(Product product);



	void updateProduct(Product product);
	
	

	
}
