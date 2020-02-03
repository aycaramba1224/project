package com.koreait.foodit.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.foodit.command.cart.CartCommand;
import com.koreait.foodit.command.cart.CartDeleteCommand;
import com.koreait.foodit.command.cart.CartInsertCommand;
import com.koreait.foodit.command.cart.CartListCommand;

@Controller
public class CartController {
 	
	@Autowired
	private SqlSession sqlSession;
	private CartCommand cartCommand;

	@RequestMapping("cartList") 
	public String cartList(Model model) {	
		cartCommand = new CartListCommand();
		cartCommand.execute(sqlSession, model);
		return "cart/cartList";
	}
	 
/*	@RequestMapping("cartInsert")  
	public String cartInsert(HttpServletRequest request, RedirectAttributes redirectAttributes,  Model model) {
		model.addAttribute("request", request);
		model.addAttribute("redirectAttributes", redirectAttributes);
		cartCommand = new CartInsertCommand();
		cartCommand.execute(sqlSession, model);
		return "redirect:/cartList";  
	} */
	
	@RequestMapping("cartInsert")  
	public String cartInsert(HttpServletRequest request, RedirectAttributes redirectAttributes,  Model model) {
		
		model.addAttribute("request", request);
		model.addAttribute("redirectAttributes", redirectAttributes);
		cartCommand = new CartInsertCommand();
		cartCommand.execute(sqlSession, model);
		return "redirect:/cartList";  
	}  
	  

	@RequestMapping("cartDelete")
	public String cartDelete(RedirectAttributes redirectAttributes,HttpServletRequest request, Model model) {
		model.addAttribute("redirectAttributes", redirectAttributes);
		model.addAttribute("request", request);
		cartCommand = new CartDeleteCommand();
		cartCommand.execute(sqlSession, model);
		return "redirect:/cartList";
	}
 
	
}

