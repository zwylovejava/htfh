package com.boot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.mapper.ClassificMapper;
import com.boot.pojo.Classific;

@Service
public class ClassificServiceImpl implements ClassificService{
	@Autowired
	private ClassificMapper classificMapper;

	@Override
	public List<Classific> findAll() {
		return classificMapper.findAll();
	}




	@Override
	public List<Classific> findAllByKey(Double _min, Double _max, String classificId, String searchName) {
		
		return classificMapper.findAllByKey(_min,_max,classificId,searchName);
	}


	

}
