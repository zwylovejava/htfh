package com.boot.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.mapper.ClassificMapper;
import com.boot.mapper.OrderItemMapper;
import com.boot.pojo.Classific;

@Service
public class BackServiceImpl implements BackService {
	@Autowired
	private ClassificMapper classificMapper;
	@Autowired
	private OrderItemMapper orderItemMapper;
	
	public List<Classific> findClassificAll() {
		return classificMapper.findAll();
	}

	public List<Integer> findSellNumByClassific(List<String> classificStr) {
		List<Integer> sellNumList = new ArrayList();
		for (String classStr : classificStr) {
			sellNumList.add(orderItemMapper.findSellListByClassific(classStr));
		}
		return sellNumList;
	}
	
	public List<Double> findSaleByClassific(List<String> classificStr) {
		List<Double> saleList = new ArrayList();
		for (String classStr : classificStr) {
			saleList.add(orderItemMapper.findSaleByClassific(classStr));
		}
		return saleList;
	}

}
