package com.koreait.foodit.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.foodit.command.product.ProductCommand;
import com.koreait.foodit.command.product.ProductListCommand;

@Controller
public class ProductController {

	@Autowired
	private SqlSession sqlSession;
	private ProductCommand productCommand;
	
	@RequestMapping("productList")
	public String productList(Model model) {
		productCommand = new ProductListCommand();
		productCommand.execute(sqlSession, model);
		return "product/productList";
	}
}
