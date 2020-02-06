package com.koreait.foodit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.koreait.foodit.command.cart.GuestCartInsertCommand;
import com.koreait.foodit.command.cart.GuestCartListCommand;

@Controller
public class CartController {
 	
	@Autowired
	private SqlSession sqlSession;
	private CartCommand cartCommand;

	@RequestMapping("cartList") 
	public String cartList(HttpServletRequest request, Model model, HttpSession session) {
		model.addAttribute("request", request);
		model.addAttribute("session", session);
		cartCommand = new CartListCommand();
		cartCommand.execute(sqlSession, model);
		return "cart/cartList";
	}
	
	@RequestMapping("cartInsert")  
	public String cartInsert(HttpServletRequest request, RedirectAttributes redirectAttributes,  Model model) {
		model.addAttribute("request", request);
		model.addAttribute("redirectAttributes", redirectAttributes);
		cartCommand = new CartInsertCommand();
		cartCommand.execute(sqlSession, model);
		return "redirect:/cartList";
	} 
	
	@RequestMapping("cartDelete")
	public String cartDelete(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		cartCommand = new CartDeleteCommand();
		cartCommand.execute(sqlSession, model);
		return "redirect:/cartList";
	}
	
	// 비회원 장바구니 
	@RequestMapping("guestCartList") 
	public String guestCartList(HttpServletRequest request, Model model, HttpSession session) {
		model.addAttribute("request", request);
		model.addAttribute("session", session);
		cartCommand = new GuestCartListCommand();
		cartCommand.execute(sqlSession, model);
		return "cart/guestCartList";
	}
  
	@RequestMapping("guestCartInsert")  
	public String guestCartInsert(HttpServletRequest request, RedirectAttributes redirectAttributes,  Model model) {
		model.addAttribute("request", request);
		model.addAttribute("redirectAttributes", redirectAttributes);
		cartCommand = new GuestCartInsertCommand();
		cartCommand.execute(sqlSession, model);
		return "redirect:/guestCartList";
	} 
	
	
	// 장바구니 메인 
	@RequestMapping("cartMain")
	public String cartMain() {
		return "cart/cartMain";
	}
}

