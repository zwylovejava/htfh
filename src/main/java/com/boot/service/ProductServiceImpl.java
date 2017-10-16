package com.boot.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.mapper.ProductMapper;
import com.boot.pojo.ClassAll;
import com.boot.pojo.Product;

@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductMapper productMapper;

	@Override
	public List<Product> findAll() {
		
		return productMapper.findAll();
	}

	@Override
	public Product findProdInfoById(String productId) {
		return productMapper.findProdInfoById(productId);
	}

	@Override
	public List<ClassAll> findAllClass() {
		return productMapper.findAllClass();
	}


	@Override
	public List<Product> findByPage(Integer perpage, Integer currentPage,
			Double minprice, Double maxprice,String classificId,String searchName,Integer sort) {
		currentPage=(currentPage-1)*perpage;
		return productMapper.findByPage(perpage,currentPage,minprice,maxprice,classificId,searchName,sort);
	}

	

	@Override
	public Number findCountByKey(Double _min, Double _max, String classificId, String searchName) {
		return productMapper.findCountByKey( _min,  _max,  classificId, searchName);
	}


	@Override
	public void addProduct(Product product) {
		if("".equals(product.getProductId())||product.getProductId()==null){
			//生成随机数
			String str =(long)((Math.random()*9+1)*100000000000000l)+"";
			product.setProductId(str);
		}
		if(product.getSaleNum()==null){
			product.setSaleNum(0);
		}
		
		productMapper.addProduct(product);
		
		
	}

	@Override
	public void updateProduct(Product product) {
		productMapper.updateProduct(product);
		
	}



	
}
