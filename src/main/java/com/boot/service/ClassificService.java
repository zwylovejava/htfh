package com.boot.service;

import java.util.List;

import com.boot.pojo.Classific;

public interface ClassificService {
	
	List<Classific> findAllByKey(Double _min, Double _max, String classificId, String searchName);

	List<Classific> findAll();
}
