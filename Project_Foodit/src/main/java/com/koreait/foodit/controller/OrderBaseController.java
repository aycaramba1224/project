package com.koreait.foodit.controller;
import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.foodit.command.orderBase.GuestOrderCommand;
import com.koreait.foodit.command.orderBase.GuestSearchNoCommand;
import com.koreait.foodit.command.orderBase.MemberDeliveryCommand;
import com.koreait.foodit.command.orderBase.MemberDeliveryListCommand;
import com.koreait.foodit.command.orderBase.OrderBaseCommand;
import com.koreait.foodit.command.orderBase.OrderBaseDeleteCommand;
import com.koreait.foodit.command.orderBase.OrderBaseInsertCommand;
import com.koreait.foodit.command.orderBase.OrderBaseListCommand;
import com.koreait.foodit.command.orderBase.OrderBaseModifyCommand;
import com.koreait.foodit.command.orderBase.OrderBaseViewCommand;
import com.koreait.foodit.command.orderBase.OrderCartListCommand;

@Controller
public class OrderBaseController {
	@Autowired
	 private SqlSession sqlSession;
	 private OrderBaseCommand orderBaseCommand;
	 
	 //장바구니 관련
	 
	 
	 
	 //주문정보입력하는 페이지(장바구니 내역이 들어가 있어야함
	 @RequestMapping("orderInsertPage")
	 public String orderInsertPage(HttpServletRequest request,Model model) {
		 model.addAttribute("request", request);
		 orderBaseCommand = new OrderCartListCommand();
		 orderBaseCommand.execute(sqlSession, model);
		 return "order/order";
	 }
	 
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
			orderBaseCommand = new MemberDeliveryCommand();
			orderBaseCommand.execute(sqlSession, model);
			return "order/order";
		}
	 
	 //회원일떄 주문내역,결제하기
	 @RequestMapping("memberOrderlistPage")
		public String memberOrderlistPage() {
		 return "order/memberOrderList";
		}
	 
	 @RequestMapping("memberOrderSearch")
		public String memberOrderSearch(HttpServletRequest request, Model model) {
		 model.addAttribute("request", request);
		 orderBaseCommand = new GuestSearchNoCommand();
		 orderBaseCommand.execute(sqlSession, model);
		 return "order/memberOrderViewPage";
		}
	 
	 /*경로 수정예정*/
	 @RequestMapping("memberbuy")
	 public String memberbuyInsert(HttpServletRequest request, Model model) {
		 model.addAttribute("request", request);
		 orderBaseCommand = new MemberDeliveryCommand();
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
	 

	 
	 @RequestMapping("orderInsert")
		public String orderInsert(HttpServletRequest request, Model model) {
		   model.addAttribute("request", request);
			orderBaseCommand = new OrderBaseInsertCommand();
			orderBaseCommand.execute(sqlSession, model);
			return "home";
		}
	 
	 @RequestMapping("orderBaseList")
		public String oderListPage(HttpServletRequest request,Model model ) {
			model.addAttribute("request", request);
			orderBaseCommand = new OrderBaseListCommand();
			orderBaseCommand.execute(sqlSession, model);
			return "order/orderBaseList";
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
