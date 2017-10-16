package com.boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/message")
public class MessageController {
	
	@RequestMapping("/selled")
	public String toCelled() {
		return "message/selled";
	}
	
	@RequestMapping("/selling")
	public String toCelling() {
		return "message/selling";
	}
	
	@RequestMapping("/discount")
	public String toDiscount() {
		return "message/discount";
	}

}
