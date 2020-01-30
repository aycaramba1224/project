package com.koreait.foodit.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.foodit.command.orderList.OrderListCommand;

@Controller
public class OrderListController {
	@Autowired
	 private SqlSession sqlSession;
	 private OrderListCommand orderListCommand;
	 
	 @RequestMapping("orderListPage")
	 public String orderListPage(Model model) {
		 
		 return "orderList/orderListPage";
	 }
	 
     //관리자가 주문 내역상태 조정
	@RequestMapping("orderListViewPage")
	public String orderListViewPage(Model model) {
		return "orderList/orderListViewPage";
	}
}
