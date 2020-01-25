package com.koreait.foodit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderBaseController {
	
	@RequestMapping("order")
	public String OrderPage() {
		return "order/order";
	}
}
