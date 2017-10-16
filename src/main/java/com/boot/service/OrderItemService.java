package com.boot.service;

import java.util.List;

import com.boot.pojo.OrderItem;

public interface OrderItemService {
	public List<OrderItem> findAllByOrderId(List<String> oIdList);

	public void deleteOrderByOrderId(String orderId);

	public List<OrderItem> findByOrderId(String orderId);
}
