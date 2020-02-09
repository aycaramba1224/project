package com.koreait.foodit.controller;
import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.foodit.command.orderBase.DeliveryInsertCommand;
import com.koreait.foodit.command.orderBase.GuestOrderCommand;
import com.koreait.foodit.command.orderBase.MemberDeliveryListCommand;
import com.koreait.foodit.command.orderBase.MemberOderBuyCommand;
import com.koreait.foodit.command.orderBase.MemberOrderListCommand;
import com.koreait.foodit.command.orderBase.OrderBaseCommand;
import com.koreait.foodit.command.orderBase.OrderBaseDeleteCommand;
import com.koreait.foodit.command.orderBase.OrderBaseInsertCommand;
import com.koreait.foodit.command.orderBase.OrderBaseModifyCommand;
import com.koreait.foodit.command.orderBase.OrderBaseViewCommand;


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
	 
	 @RequestMapping("memberdeliveryInsert")
	 public String  memberdeliverylistPage(HttpServletRequest request,Model model ) {
			model.addAttribute("request", request);
			orderBaseCommand = new DeliveryInsertCommand();
			orderBaseCommand.execute(sqlSession, model);
			return "order/order";
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
		 return "home";
	 }
	
	 //비회원 주문/배송조회
	
	 
	 @RequestMapping("guestSearch")
		public String guestSearch(HttpServletRequest request,Model model) {
		    model.addAttribute("request", request);
		    orderBaseCommand = new GuestOrderCommand();
			orderBaseCommand.execute(sqlSession, model);
			return "guest/guestOrder";
		}
	 
	 
	 //비회원 주문
	 @RequestMapping("orderInsert")
		public String orderInsert(HttpServletRequest request, Model model) {
		   model.addAttribute("request", request);
			orderBaseCommand = new OrderBaseInsertCommand();
			orderBaseCommand.execute(sqlSession, model);
			return "home";
		}
		
	 /*
	  * 관리자 입장에서 관리할 거 경로 수정이 필요합니다.
	  */
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
