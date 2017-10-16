package com.boot.service;

import java.util.List;

import com.boot.pojo.Product;

public interface BackProductService {
	Number findCount(Double _min, Double _max, String _classificName, String _proName);

	List<Product> findproductListByKeyAndPage(Integer perpage, Integer currentPage, Double _min, Double _max,
			String _classificName, String _proName);

	void deleteProductById(String productId);

	void deleteProducts(String[] productIds);

}
