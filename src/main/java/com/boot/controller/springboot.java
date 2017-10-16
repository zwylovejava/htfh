package com.boot.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class springboot {
   @RequestMapping("/hello")
	public String hell(){
	   return "hello spring";
   }
}
