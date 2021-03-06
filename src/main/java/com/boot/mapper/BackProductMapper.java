package com.boot.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;

import com.boot.pojo.Product;

public interface BackProductMapper {
	Number findCount(@Param("minprice")Double _min, @Param("maxprice")Double _max, 
			@Param("classificName")String _classificName, @Param("proName")String _proName);

	List<Product> findproductListByKeyAndPage(@Param("perpage")Integer perpage, @Param("currentPage")Integer currentPage, 
			@Param("minprice")Double _min, @Param("maxprice")Double _max,
			@Param("classificName")String _classificName, @Param("proName")String _proName);
	@Delete("delete from product where product_id=#{productId}")
	void deleteProductById(String productId);

	void deleteProducts(String[] productIds);

}
