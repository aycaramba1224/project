package com.koreait.foodit.controller;
import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.foodit.command.orderBase.AdminguestorderListCommand;
import com.koreait.foodit.command.orderBase.GuestOrderCommand;
import com.koreait.foodit.command.orderBase.MemberDeliveryListCommand;
import com.koreait.foodit.command.orderBase.MemberOderBuyCommand;
import com.koreait.foodit.command.orderBase.MemberOrderListCommand;
import com.koreait.foodit.command.orderBase.OrderBaseCommand;
import com.koreait.foodit.command.orderBase.OrderBaseInsertCommand;



@Controller
public class OrderBaseController {
	@Autowired
	 private SqlSession sqlSession;
	 private OrderBaseCommand orderBaseCommand;
	 
	 //장바구니 관련
	
	 //회원일떄 보내는 
	 //배송지 등록등 
	 
	 @RequestMapping("mdeliverylistPage")
	 public String memberDeliveryList(HttpServletRequest request,Model model ) {
			model.addAttribute("request", request);
			orderBaseCommand = new MemberDeliveryListCommand();
			orderBaseCommand.execute(sqlSession, model);
			return "order/memberDeliveryView";
		}
	 
	 @RequestMapping("mdeliverysendPage")
		public String memberDeliverySendPage() {
		 return "order/memberDeliverysend";
		}
	 
	  //관리자
	 
	 @RequestMapping("adminGuestOrderList")
		public String  adminGuestOrderList(HttpServletRequest request, Model model) {
		 model.addAttribute("request", request);
		 orderBaseCommand =  new AdminguestorderListCommand();
		 orderBaseCommand.execute(sqlSession, model);
		 return "order/adminGuestOrderList";
		}
	
	 
	 //회원일떄 주문내역
	 @RequestMapping("memberOrderlistPage")
		public String memberOrderlistPage(HttpServletRequest request, Model model) {
		 model.addAttribute("request", request);
		 orderBaseCommand =  new MemberOrderListCommand();
		 orderBaseCommand.execute(sqlSession, model);
		 return "order/memberOrderList";
		}
	
	 /*경로 수정예정*/
	 @RequestMapping("memberbuy")
	 public String memberbuyInsert(HttpServletRequest request, Model model) {
		 model.addAttribute("request", request);
		 orderBaseCommand = new MemberOderBuyCommand();
		 orderBaseCommand.execute(sqlSession, model);
		 return "index";
	 }
	
	 //비회원 주문/배송조회
	 @RequestMapping("guestSearch")
		public String guestSearch(HttpServletRequest request,Model model) {
		    model.addAttribute("request", request);
		    orderBaseCommand = new GuestOrderCommand();
			orderBaseCommand.execute(sqlSession, model);
			return "guest/guestorderList";
		}
	 
	 
	 //비회원 주문
	 @RequestMapping("orderInsert")
		public String orderInsert(HttpServletRequest request, Model model) {
		   model.addAttribute("request", request);
			orderBaseCommand = new OrderBaseInsertCommand();
			orderBaseCommand.execute(sqlSession, model);
			return "home";
		}
		
	
	 
}
