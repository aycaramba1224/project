package com.koreait.foodit.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.koreait.foodit.command.orderBase.OrderBaseCommand;
import com.koreait.foodit.command.orderBase.OrderBaseDeleteCommand;
import com.koreait.foodit.command.orderBase.OrderBaseInsertCommand;
import com.koreait.foodit.command.orderBase.OrderBaseListCommand;
import com.koreait.foodit.command.orderBase.OrderBaseModifyCommand;
import com.koreait.foodit.command.orderBase.OrderBaseViewCommand;



@Controller
public class OrderBaseController {
	@Autowired
	 private SqlSession sqlSession;
	 private OrderBaseCommand orderBaseCommand;
	 
	 @RequestMapping("orderInsertPage")
		public String orderInsertPage() {
			return "order/order";
		}
	 
	//주문정보입력하는 페이지
	 @RequestMapping("orderInsert")
		public String orderInsert(RedirectAttributes redirectAttributes,HttpServletRequest request, Model model) {
		    model.addAttribute("request", request);
			model.addAttribute("redirectAttributes",redirectAttributes);
			orderBaseCommand = new OrderBaseInsertCommand();
			orderBaseCommand.execute(sqlSession, model);
			return "redirect:/orderBaseList";
		}
	 
	 
	 
	@RequestMapping("orderBaseList")
	public String oderListPage(HttpServletRequest request,Model model ) {
		model.addAttribute("request", request);
		orderBaseCommand = new OrderBaseListCommand();
		orderBaseCommand.execute(sqlSession, model);
		return "order/orderBaseList";
	}
	
	
	
	@RequestMapping("orderbaseListview")
	public String orderbaseListview(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		orderBaseCommand = new OrderBaseViewCommand();
		orderBaseCommand.execute(sqlSession, model);
		return "order/orderBaseView";
	}
	
	@RequestMapping("orderListModify")
	public String orderListModify(RedirectAttributes redirectAttributes,HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("redirectAttributes",redirectAttributes);
		orderBaseCommand = new OrderBaseModifyCommand();
		orderBaseCommand.execute(sqlSession, model);
		return "redirect:/orderBaseList";
	}
	
	@RequestMapping("orderBaseDelete")
	public String orderBaseDelete(RedirectAttributes redirectAttributes,HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("redirectAttributes",redirectAttributes);
		orderBaseCommand = new OrderBaseDeleteCommand();
		orderBaseCommand.execute(sqlSession, model);
		return "redirect:/orderBaseList";
	}
	
}
