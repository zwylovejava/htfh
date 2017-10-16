package com.boot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.pojo.Classific;
import com.boot.pojo.Page;
import com.boot.pojo.Product;
import com.boot.service.ClassificService;
import com.boot.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	private ProductService productService;
	@Autowired
	private ClassificService classificService;
	@RequestMapping("/findAll")
	public String findAll(Model model,Page page,String minprice,String maxprice,
			String classificId,String searchName,String sort){
		
		Double _min=null;
		Double _max=null;
		if(!(minprice==null)&&!("".equals(minprice))){
			_min=Double.parseDouble(minprice.trim());
		}
		if(!(maxprice==null)&&!("".equals(maxprice))){
			_max=Double.parseDouble(maxprice.trim());
		}
		if("".equals(classificId)){
			classificId=null;
		}
		Integer _sort=null;
		if(!("".equals(sort))&&!(sort==null)){
			_sort=Integer.parseInt(sort);
			
		}
		List<Classific> classificList =classificService.findAllByKey(_min,_max,classificId,searchName);
		Number count =productService.findCountByKey(_min,_max,classificId,searchName);
		page.setRecords((Integer) count);
		List<Product> productCurrentPageList=
				productService.findByPage(page.getPerpage(),page.getCurrentPage(),
						_min,_max,classificId,searchName,_sort);
		List<Product> productList =productService.findAll();
		model.addAttribute("sort", _sort);
		model.addAttribute("searchName", searchName);
		model.addAttribute("minprice", _min);
		model.addAttribute("maxprice", _max);
		model.addAttribute("page", page);
		model.addAttribute("classificList", classificList);
		model.addAttribute("classificId", classificId);
		model.addAttribute("productList", productList);
		model.addAttribute("productCurrentPageList", productCurrentPageList);
		return "product/prodList";
	}
	@RequestMapping("/findProdInfo")
	public String findProdInfo(Model model,String productId){
		Product product=productService.findProdInfoById(productId);
		model.addAttribute("product", product);
		return "product/prodInfo";
	}
	
	

	
	
	


}
