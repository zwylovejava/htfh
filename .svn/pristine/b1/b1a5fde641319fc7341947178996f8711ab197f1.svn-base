package com.boot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.pojo.ClassAll;
import com.boot.service.ProductService;
@Controller
public class homeController {
	@Autowired
	private ProductService productService;
    @RequestMapping("/home")
    public String index(Model model) {
    	List<ClassAll> classAllList =productService.findAllClass();
		model.addAttribute("classAllList", classAllList);
		return "index";
    }
}
