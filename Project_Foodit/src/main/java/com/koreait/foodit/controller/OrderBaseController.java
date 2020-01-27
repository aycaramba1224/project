package com.koreait.foodit.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.foodit.command.guest.GuestinsertCommand;
import com.koreait.foodit.command.orderBase.OrderBaseCommand;
import com.koreait.foodit.command.orderBase.OrderBaseInsertCommand;
import com.koreait.foodit.command.orderBase.OrderBaseListCommand;

@Controller
public class OrderBaseController {
	@Autowired
	 private SqlSession sqlSession;
	 private OrderBaseCommand orderBaseCommand;
	
	 //주문정보입력하는 페이지
	@RequestMapping("order")
	public String OrderPage( ) {
		return "order/order";
	}
	
	@RequestMapping("oderListPage")
	public String oderListPage(HttpServletRequest request,Model model ) {
		model.addAttribute("request", request);
		orderBaseCommand = new OrderBaseListCommand();
		orderBaseCommand.execute(sqlSession, model);
		return "order/orderList";
	}
	
	
	@RequestMapping("orderInsert")
	public String orderList(RedirectAttributes redirectAttributes
			,HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		orderBaseCommand = new OrderBaseInsertCommand();
		orderBaseCommand.execute(sqlSession, model);
		return "riderect:/orderList";
	}
	
}
