package com.boot.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;


import com.boot.pojo.Classific;

public interface ClassificMapper {

	List<Classific> findAllByKey(@Param("minprice")Double _min, @Param("maxprice")Double _max, 
			@Param("classificId")String classificId, @Param("proName")String searchName);

	public List<Classific> findAll();

}
