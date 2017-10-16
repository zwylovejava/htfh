package com.boot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.mapper.OrderItemMapper;
import com.boot.pojo.OrderItem;
@Service
public class OrderItemServiceImpl implements OrderItemService {
	@Autowired
	private OrderItemMapper orderItemMapper; 
	
	@Override
	public List<OrderItem> findAllByOrderId(List<String> oIdList) {
		return orderItemMapper.findAllByOrderId(oIdList);
	}

	@Override
	public void deleteOrderByOrderId(String orderId) {
		orderItemMapper.deleteOrderByOrderId(orderId);
	}

	@Override
	public List<OrderItem> findByOrderId(String orderId) {
		return orderItemMapper.findByOrderId(orderId);
	}

}
