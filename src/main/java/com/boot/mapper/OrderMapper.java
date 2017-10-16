
package com.boot.mapper;

import com.boot.pojo.OrderItem;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.boot.pojo.Order;

public interface OrderMapper {

	public List<Order> findAllById(String userId);

	public void addOrder(Order order);
	
	public void addOrderItem(OrderItem oi);

	public void deleteOrderByOrderId(String orderId);

	public void updateStateByOrderId(@Param("orderId")String orderId, @Param("state")int state);

	public void updateConfirmByOrderId(@Param("orderId")String orderId, @Param("confirm")int confirm);

	public List<Order> findAllByState(@Param("userId")String userId, @Param("state")int state);

	public List<Order> findAllByDelivery(@Param("userId")String userId, @Param("state")int state, @Param("delivery")int delivery);
	
	public List<Order> findAllByConfirm(@Param("userId")String userId, @Param("state")int state, @Param("delivery")int delivery, @Param("confirm")int confirm);

	public Order findOrderByOrderId(String orderId);

	public List<Order> findAll();

	public List<Order> findbypage(Integer page);
	
	@Select("select count(*) from orders")
	public Integer getOrderCount();

	public void updateDeliveryByOrderId(@Param("orderId")String orderId,@Param("delivery")int delivery);

	public List<Order> findOrderListbyall(@Param("orderby")Integer orderby, @Param("value")String value, @Param("page")Integer page);

	public Integer findOrderListCount(@Param("orderby")Integer orderby, @Param("value")String value, @Param("page")Integer page);
	
	public Integer[] findStatesById(String productId);
}

