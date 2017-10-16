package com.boot.controller;

import static org.assertj.core.api.Assertions.entry;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.mapper.OrderMapper;
import com.boot.pojo.Address;
import com.boot.pojo.Order;
import com.boot.pojo.OrderItem;
import com.boot.pojo.Product;
import com.boot.pojo.User;
import com.boot.service.AddressService;
import com.boot.service.OrderService;
import com.boot.service.ProductService;


@Controller
public class OrderController_1 {
	@Autowired
	private ProductService productService;
	
	@Autowired
	private AddressService addressService;
	
	@Autowired
	private OrderService orderService;
	
	
	
	@RequestMapping("order/orderadd")
	public String orderadd(HttpSession session,String[] productId,String receiveId){
		Product product = new Product();
		Map<Product,Integer> cartList = (Map<Product, Integer>) (session.getAttribute("cart"));
		Order order = new Order();
		order.setOrderId(UUID.randomUUID().toString());
		order.setReceiveId(receiveId);
		User user = (User)(session.getAttribute("LoginUser"));
		order.setUserId(user.getUserId());
		order.setOrderTime(new Date());
		order.setConfirm(0);
		order.setState(0);
		order.setDelivery(0);
		Map<Product,Integer> newCartList = new HashMap<>();
		List<String> pIdList = Arrays.asList(productId);
		double money = 0;
		List<OrderItem> oiList = new ArrayList<>();
		//========页头数据====
		int cart_totalNum=0;
		double cart_totalMoney=0;
		Product cart_product=null;
		//==================
		for(Map.Entry<Product,Integer> entry:cartList.entrySet()) {
			if(pIdList.contains(entry.getKey().getProductId())) {
				money+=entry.getKey().getPrice()*entry.getValue();
				OrderItem orderItem = new OrderItem();
				
				orderItem.setOrderId(order.getOrderId());
				orderItem.setBuyNum(entry.getValue());
				orderItem.setProductId(entry.getKey().getProductId());
				orderItem.setAssess(entry.getKey().getDescription());
				oiList.add(orderItem);
			}else {
				newCartList.put(entry.getKey(),entry.getValue());
				cart_totalNum+=1;
				cart_totalMoney+=entry.getKey().getPrice()*entry.getValue();
				cart_product=entry.getKey();
			}
		}
		order.setMoney(money);
		orderService.addOrder(order,oiList);
		session.setAttribute("cart", newCartList);
		//========页头数据====
			if(cart_totalNum==0) {
				session.removeAttribute("cart_product");
			}else {
				session.setAttribute("cart_product", cart_product);
				session.setAttribute("cart_totalMoney", cart_totalMoney);
				session.setAttribute("cart_totalNum", cart_totalNum);
			}
		//==================
		
		return "redirect:/toOrder";
	}
	//==============================================================
	//						后台代码分割线
	//==============================================================
	//@RequestMapping("orderback/toOrderBack")
	public String toBackorderList(Model model) {
		List<Order> orderList = orderService.finaAll();
		int pages = (orderList.size()-1)/10+1;
		model.addAttribute("pages",pages);
		if(pages>1) {
			orderList = orderList.subList(0,10);
		}
		model.addAttribute("orderList",orderList);
			
		return "/back/order/order_list";
	}
	
	
	
	//bug代码    没有用
	@RequestMapping("orderback/toOrderBack")
	public String toBack_orderList(Model model,Integer page,Integer source) {
		if(page==null) {
			page=1;
		}
		List<Order> orderList = orderService.findbypage(page);
		Integer pages = orderService.getOrderCount();
		
		model.addAttribute("pages",(pages+9)/10);
		model.addAttribute("orderList",orderList);
		model.addAttribute("page",page);
		
		return "/back/order/order_list";
	}
	@RequestMapping("orderback/queryOrder")
	public String queryOrder(Integer orderby,String value,Model model,Integer page) {
		if(orderby==null||orderby==1) {
			orderby=1;
		}
		if(value==null) {
			value="";
		}
		if(page==null) {
			page=1;
		}
		 
		Map<String, Object> entry = orderService.findOrderListbyall(orderby,value,page);
		
		List<Order> orderList = (List<Order>) entry.get("orderList");
		
		Integer pages = (Integer) entry.get("pages");
		
		model.addAttribute("orderList",orderList);
		model.addAttribute("orderby",orderby);
		model.addAttribute("value",value);
		model.addAttribute("page",page);
		model.addAttribute("pages",(pages+9)/10);
		
		return "/back/order/order_list";
	}
	
	@RequestMapping("/orderback/deleteOrder")
	public String deleteOrder(String orderId,Integer orderby,String value,Model model,Integer page) {
		orderService.deleteOrderByOrderId(orderId);
		return "redirect:/orderback/queryOrder?orderby="+orderby+"&vlaue="+value+"&page="+page;
		
	}

}
