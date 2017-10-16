package com.boot.controller;

import java.util.List;
import java.util.UUID;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.pojo.Address;
import com.boot.pojo.User;
import com.boot.service.AddressService;

@Controller
public class AddressController {
	@Autowired
	private AddressService addressService;
	
	
	
	@RequestMapping("address/toaddress")
	public String toaddress(HttpSession session,Model model,String ordersend) {
		Object obj = session.getAttribute("LoginUser");
		if(obj==null) {
			return "login/login";
		}
		User user = (User)obj;
		String userId = user.getUserId();
		List<Address> addressList = addressService.findAllbyUserId(userId);
		model.addAttribute("addressList",addressList);
		model.addAttribute("addressNum",addressList.size());
		
		if(ordersend!=null) {
			model.addAttribute("ordersend","ordersend");
		}
		return "address/address";
	}
	
	@RequestMapping("/address/addressadd")
	public String addressadd(Model model,String ordersend,HttpSession session,Address address,String cmbProvince, String cmbCity,String cmbArea,String tel_1,String tel_2,String tel_3) {
		String area = cmbProvince+cmbCity+cmbArea;
		String tel = tel_1+"-"+tel_2+"-"+tel_3;
		address.setArea(area);
		address.setTel(tel);
		if(address.getAddr()==null) {
			address.setAddr(0);
		}
		address.setReceiveId(UUID.randomUUID().toString());
		String userId = ((User)session.getAttribute("LoginUser")).getUserId();
		address.setUserId(userId);
		address.setAddr(1);  
		addressService.addAddress(address);
		System.out.println(ordersend);
		if(ordersend!=null&&"ordersend".equals(ordersend)) {
			List<Address> addressList = addressService.findAllbyUserId(userId);
			model.addAttribute("addressList",addressList);
			model.addAttribute("addressNum",addressList.size());
			return "order/orderadd";
		}
		return "redirect:/address/toaddress";
	}
	
	@RequestMapping("/address/addressdel")
	public String addressdel(String[] receiveId) {
		addressService.deleteAddressbyReceivedId(receiveId);
		return "redirect:/address/toaddress";
	}

}
