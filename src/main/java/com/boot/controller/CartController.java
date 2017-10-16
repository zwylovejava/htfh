package com.boot.controller;



import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.pojo.Address;
import com.boot.pojo.Product;
import com.boot.pojo.User;
import com.boot.service.AddressService;
import com.boot.service.ProductService;

@Controller
public class CartController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private AddressService addressService;
	
	//转向订单添加页面
	@RequestMapping("cart/orderadd")
	public String orderadd(Model model,String[] productId, HttpSession session) {
		if(productId==null) {
			return "cart/cartList";
		}
		Object obj = session.getAttribute("LoginUser");
		if(obj==null) {
			return "login/login";
		}
		Map<Product,Integer> cart = (Map<Product, Integer>) session.getAttribute("cart");
		Map<Product,Integer> cart_1 = new HashMap<>();
		
		List<String> pList = Arrays.asList(productId);
		for(Map.Entry<Product, Integer> entry:cart.entrySet()) {
			if(pList.contains(entry.getKey().getProductId())) {
				cart_1.put(entry.getKey(), entry.getValue());
			}
		}
		
		
		model.addAttribute("cart",cart_1);
		session.setAttribute("cart_1", cart_1);
		//===============
		
		User user = (User)obj;
		String userId = user.getUserId();
		List<Address> addressList = addressService.findAllbyUserId(userId);
		model.addAttribute("addressList",addressList);
		model.addAttribute("addressNum",addressList.size());
		return "order/orderadd";
	}
		
	
	@RequestMapping("cart/cartadd")
	public String cartAdd(String[] productId,HttpSession session,Integer source,Integer proNum) {
		
		if(productId==null) {
			return "cart/cartList";
		}
		Product product = productService.findProdInfoById(productId[0]);
		Object cartObj = session.getAttribute("cart");
		Map<Product,Integer> cart = null;
		if(cartObj!=null){
			cart = (Map<Product,Integer>)cartObj;
		}else{
			cart = new HashMap<Product, Integer>();
			session.setAttribute("cart", cart);
		}
		if(proNum==null) {
			proNum=1;
		}
		if(cart.containsKey(product)){
			cart.put(product, cart.get(product)+proNum);
		}else{
			cart.put(product, proNum);
		}
		int cart_totalNum=0;
		double cart_totalMoney=0;
		for(Map.Entry<Product,Integer> entry:cart.entrySet()) {
			cart_totalNum+=1;
			cart_totalMoney+=entry.getKey().getPrice()*entry.getValue();
		}
		
		session.setAttribute("cart_totalNum", cart_totalNum);
		session.setAttribute("cart_totalMoney", cart_totalMoney);
		session.setAttribute("cart_product", product);
		if(source!=null) {
			return "redirect:/product/findProdInfo.action?productId="+productId[0];
		}
		return "cart/cartList";
	}
	
	
	//购物车删除按钮跳转方法
	/*/cart/cartdelbyProductId?productId=${entry.key.productId}*/
	@RequestMapping("cart/cartdelete")
	public String cartdelete(String[] productId,HttpSession session) {
		if(productId==null) {
			return "cart/cartList";
		}
		
		Map<Product, Integer> cart = (Map<Product, Integer>) session.getAttribute("cart");
		Product product = new Product();
		for(String pid:productId) {
			product.setProductId(pid);
			cart.remove(product);
		}
	
		if(cart.size()==0){//当购物车没有商品时从session中清除
			session.removeAttribute("cart");
			session.removeAttribute("cart_product");
		}
		return "cart/cartList";
	}
	
	
	@RequestMapping("cart/cartdecrease")
	public String cartcartdecrease(String[] productId,HttpSession session) {
		if(productId==null) {
			return "cart/cartList";
		}
		
		Map<Product, Integer> cart = (Map<Product, Integer>) session.getAttribute("cart");
		Product product = new Product();
		for(String pid:productId) {
			
			product.setProductId(pid);
			if(cart.get(product)!=null&&cart.get(product)>1) {
				cart.put(product, cart.get(product)-1);
			}else{
				cart.remove(product);
			}
		}
		
		if(cart.size()==0){//当购物车没有商品时从session中清除
			session.removeAttribute("cart");
			session.removeAttribute("cart_product");
		}
		
		return "cart/cartList";
	}
	
	
	@RequestMapping("cart/orderaddbyPro")
	public String orderaddPro(Model model,String productId, HttpSession session,Integer proNum) {
		if(productId==null) {
			return "cart/cartList";
		}
		Object obj = session.getAttribute("LoginUser");
		if(obj==null) {
			return "login/login";
		}
		Map<Product,Integer> cart_1 = new HashMap<>();
		Product product = productService.findProdInfoById(productId);
		cart_1.put(product,proNum);
		session.setAttribute("cart_1", cart_1);
		User user = (User)obj;
		String userId = user.getUserId();
		List<Address> addressList = addressService.findAllbyUserId(userId);
		model.addAttribute("addressList",addressList);
		model.addAttribute("addressNum",addressList.size());
		return "order/orderadd";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
