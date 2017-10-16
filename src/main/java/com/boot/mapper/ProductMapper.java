package com.boot.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.boot.pojo.ClassAll;
import com.boot.pojo.Product;

public interface ProductMapper {

	List<Product> findAll();

	Product findProdInfoById(String productId);

	List<ClassAll> findAllClass();


	List<Product> findByPage(@Param("perpage")Integer perpage, @Param("currentPage")Integer currentPage,
			@Param("minprice")Double minprice,@Param("maxprice")Double maxprice,
			@Param("classificId")String classificId,@Param("proName")String searchName,@Param("sort")Integer sort);


	Number findCountByKey(@Param("minprice")Double _min, @Param("maxprice")Double _max, 
			@Param("classificId")String classificId, @Param("proName")String searchName);
	//添加商品方法
	void addProduct(Product product);
	//修改商品
	void updateProduct(Product product);

	

}
