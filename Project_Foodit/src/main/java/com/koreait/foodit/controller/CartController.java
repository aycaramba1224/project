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
import com.koreait.foodit.command.cart.GuestCartDeleteCommand;
import com.koreait.foodit.command.cart.GuestCartInsertCommand;
import com.koreait.foodit.command.cart.GuestCartListCommand;
import com.koreait.foodit.command.cart.GuestOrderCartListCommand;
import com.koreait.foodit.command.cart.OrderCartListCommand;

@Controller
public class CartController {
 	
	@Autowired
	private SqlSession sqlSession;
	private CartCommand cartCommand;

	// 기본 CRUD
	@RequestMapping("cartList") 
	public String cartList(HttpServletRequest request, Model model, HttpSession session) {
		model.addAttribute("request", request);
		model.addAttribute("session", session);
		cartCommand = new CartListCommand();
		cartCommand.execute(sqlSession, model);
		return "cart/cartList";
	}
	
	@RequestMapping("cartInsert")  
	public String cartInsert(RedirectAttributes redirectAttributes, HttpServletRequest request, Model model) {
		model.addAttribute("redirectAttributes", redirectAttributes);
		model.addAttribute("request", request);
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
	public String guestCartInsert(RedirectAttributes redirectAttributes,HttpServletRequest request, Model model) {
		model.addAttribute("redirectAttributes", redirectAttributes);
		model.addAttribute("request", request);
		cartCommand = new GuestCartInsertCommand();
		cartCommand.execute(sqlSession, model);
		return "redirect:/guestCartList";
	} 
	
	@RequestMapping("guestCartDelete")
	public String guestCartDelete(RedirectAttributes redirectAttributes,HttpServletRequest request, Model model) {
		model.addAttribute("redirectAttributes", redirectAttributes);
		model.addAttribute("request", request);
		cartCommand = new GuestCartDeleteCommand();
		cartCommand.execute(sqlSession, model);
		return "redirect:/guestCartList";
	}
	
	// 장바구니 메인 페이지
	@RequestMapping("cartMain")
	public String cartMain() {
		return "cart/cartMain";
	}
	
	//주문하기 했을떄 cartList에 있는 값이 insert되야됨
			//OrderCartInsertCommand안에 List 할 수 있는 Dao 도 같이 넣으면 됨
			@RequestMapping("orderInsertPage")
				public String orderInsertPage(HttpServletRequest request, Model model) {
				model.addAttribute("request", request);
				cartCommand = new OrderCartListCommand();
				cartCommand.execute(sqlSession, model);
				return "order/order";
			}
			
			//비회원일때 
			@RequestMapping("guestorderPage")
				public String guestorderPage(HttpServletRequest request, Model model) {
					model.addAttribute("request", request);
					cartCommand = new GuestOrderCartListCommand();
					cartCommand.execute(sqlSession, model);
					return "order/guestorder";
				}
			
}

