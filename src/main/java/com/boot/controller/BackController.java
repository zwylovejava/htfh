package com.boot.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.pojo.Classific;
import com.boot.service.BackProductService;
import com.boot.service.BackService;

@Controller()
@RequestMapping("/back")
public class BackController {
	@Autowired
	private BackProductService backProductService;
	@Autowired
	private BackService backService;
	
	@RequestMapping("/toBackIndex")
	
	public String toBackIndex(HttpSession session){
		List<String> classificStr = new ArrayList(); //定义一个集合，用于存储产品分类名
		List<Classific> classificList = backService.findClassificAll(); //查询所有产品分类
		//遍历分类集合，获取所有产品分类名
		for (Classific classific : classificList) {
			classificStr.add(classific.getClassificName());
		}
		//通过类名，查询各类产品的销量
		List<Integer> sellNum = backService.findSellNumByClassific(classificStr);
		//将类名和产品销量数据存储与session中
		session.setAttribute("classificStr", classificStr);
		session.setAttribute("sellNum", sellNum);
		return "back/index";
	}
	
	@RequestMapping("/saleroom")
	public String saleroom(HttpSession session) {
		List<String> classificStr = new ArrayList(); //定义一个集合，用于存储产品分类名
		List<Classific> classificList = backService.findClassificAll(); //查询所有产品分类
		//遍历分类集合，获取所有产品分类名
		for (Classific classific : classificList) {
			classificStr.add(classific.getClassificName());
		}
		//通过类名，查询各类产品的销售额
		List<Double> saleList = backService.findSaleByClassific(classificStr);
		//将类名和产品销量数据存储与session中
		session.setAttribute("classificStr", classificStr);
		session.setAttribute("saleList", saleList);
		return "back/sales_volume";
	}
}
