package com.koreait.foodit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class buyController {

	@RequestMapping("buyList")
	public String buyList() {
		return "buy/buyList";
	}
}
