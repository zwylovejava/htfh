package com.boot.service;

import java.util.List;

import com.boot.pojo.Classific;

public interface BackService {

	/**查询产品分类信息
	 * @return 返回所有产品分类组成的List
	 */
	public List<Classific> findClassificAll();

	/**根据产品类别查询相应类别产品的销售量
	 * @param classific 产品分类集合
	 * @return 返回查询到得所有产品类对应销售量组成的集合
	 */
	public List<Integer> findSellNumByClassific(List<String> classificStr);
	
	/**根据产品类别查询相应类别产品的销售量
	 * @param classific 产品分类集合
	 * @return 返回查询到得所有产品类对应销售量组成的集合
	 */
	public List<Double> findSaleByClassific(List<String> classificStr);
	
}
