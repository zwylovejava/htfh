package com.boot.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.mapper.OrderItemMapper;
import com.boot.mapper.OrderMapper;
import com.boot.pojo.Order;
import com.boot.pojo.OrderItem;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private OrderItemMapper orderItemMapper;
	
	@Override
	public List<Order> findAllById(String userId) {
		return orderMapper.findAllById(userId);
	}

	@Override
	public void deleteOrderByOrderId(String orderId) {
		orderMapper.deleteOrderByOrderId(orderId);
		orderItemMapper.deleteOrderByOrderId(orderId);
		
	}

	@Override
	public void updateStateByOrderId(String orderId, int state) {
		orderMapper.updateStateByOrderId(orderId, state);
	}

	@Override
	public void updateConfirmByOrderId(String orderId, int confirm) {
		orderMapper.updateConfirmByOrderId(orderId, confirm);
	}

	@Override
	public List<Order> findAllByState(String userId, int state) {
		return orderMapper.findAllByState(userId, state);
	}

	@Override
	public List<Order> findAllByDelivery(String userId, int state, int delivery) {
		return orderMapper.findAllByDelivery(userId, state, delivery);
	}

	@Override
	public List<Order> findAllByConfirm(String userId, int state, int delivery, int confirm) {
		return orderMapper.findAllByConfirm(userId, state, delivery, confirm);
	}

	@Override
	public Order findOrderByOrderId(String orderId) {
		return orderMapper.findOrderByOrderId(orderId);
	}
	
	/*=============svm_zhu==============*/
	@Override
	public void addOrder(Order order, List<OrderItem> oiList) {
		for(OrderItem oi:oiList) {
			orderMapper.addOrderItem(oi);
		}
		orderMapper.addOrder(order);
	}
	
	@Override
	public List<Order> finaAll() {
		return orderMapper.findAll();
	}
	
	@Override
	public List<Order> findbypage(Integer page) {
		return orderMapper.findbypage((page-1)*10);
	}
	
	@Override
	public Integer getOrderCount() {
		return null;
	}
	
	@Override
	public Map<String, Object> findOrderListbyall(Integer orderby, String value, Integer page) {
		
		Map map = new HashMap<String,Object>();
		List<Order> orderList = orderMapper.findOrderListbyall( orderby,  value,  (page-1)*10);
		Integer pages = orderMapper.findOrderListCount( orderby,  value,  (page-1)*10);
		map.put("orderList", orderList);
		map.put("pages", pages);
		
		
		return map;
	}
	/*=============svm_zhu==============*/

	@Override
	public void updateDeliveryByOrderId(String orderId, int delivery) {
		orderMapper.updateDeliveryByOrderId(orderId, delivery);
	}

	@Override
	public Integer[] findStatesById(String productId) {
		
		return orderMapper.findStatesById(productId);
	}







}
