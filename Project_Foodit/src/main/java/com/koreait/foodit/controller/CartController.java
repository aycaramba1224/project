package com.koreait.foodit.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.foodit.command.cart.CartCommand;
import com.koreait.foodit.command.cart.CartInsertCommand;
import com.koreait.foodit.command.cart.CartViewCommand;

@Controller
public class CartController {
	
	@Autowired
	private SqlSession sqlSession;
	private CartCommand cartCommand;

	 @RequestMapping("cartList") 
	public String cartList( ) {		
		 	 
		return "cart/cartList";
	}
	
	@RequestMapping("cartView")
	public String cartView(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		cartCommand = new CartViewCommand();
		cartCommand.execute(sqlSession, model);
		
		return "cart/cartView";
	}
	
	@RequestMapping("cartInsert")
	public String cartInsert(RedirectAttributes redirectAttributes, HttpServletRequest request,
								Model model	) {
		model.addAttribute("redirectAttributes", redirectAttributes);
		model.addAttribute("request", request);
		cartCommand = new CartInsertCommand();
		cartCommand.execute(sqlSession, model);
		return "redirect:/cartView";		
	}	 
	
}
