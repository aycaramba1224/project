package com.koreait.foodit.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.koreait.foodit.command.orderBase.GuestOrderCommand;
import com.koreait.foodit.command.orderBase.GuestOrderViewCommand;
import com.koreait.foodit.command.orderBase.MemberDeliveryCommand;
import com.koreait.foodit.command.orderBase.MemberDeliveryListCommand;
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
	 
	 
	 //회원일떄 보내는 
	 //배송지 등록등 
	 
	 @RequestMapping("mdeliverylistPage")
	 public String memberDeliveryList(HttpSession session,HttpServletRequest request,Model model ) {
			model.addAttribute("request", request);
			 session = request.getSession();
			 session.getAttribute("mDto");
			orderBaseCommand = new MemberDeliveryListCommand();
			orderBaseCommand.execute(sqlSession, model);
			return "order/memberDeliveryView";
		}
	 
	 @RequestMapping("mdeliverysendPage")
		public String memberDeliverySendPage() {
		 return "order/memberDeliverysend";
		}
	 
	 @RequestMapping("memberdeliveryInsert")
	 public String  memberdeliverylistPage(HttpSession session,HttpServletRequest request,Model model ) {
			model.addAttribute("request", request);
			 session = request.getSession();
			 session.getAttribute("mDto");
			orderBaseCommand = new MemberDeliveryCommand();
			orderBaseCommand.execute(sqlSession, model);
			return "order/order";
		}
	 
	 //회원일떄 주문내역,결제하기
	 @RequestMapping("memberOrderlistPage")
		public String memberOrderlistPage(HttpSession session,HttpServletRequest request, Model model) {
		 model.addAttribute("request", request);
		 session = request.getSession();
		 session.getAttribute("mDto");
		 orderBaseCommand = new MemberDeliveryListCommand();
		 orderBaseCommand.execute(sqlSession, model);
		 return "order/memberOrderList";
		}
	 
	 @RequestMapping("memberbuy")
	 public String memberbuyInsert(HttpServletRequest request, Model model) {
		 model.addAttribute("request", request);
		 orderBaseCommand = new MemberDeliveryCommand();
		 orderBaseCommand.execute(sqlSession, model);
		 return "home";
	 }
	
	   //등록 되어 있는 배송목록 자세히 보기에서 order페이지로 정보를 보내주는
	 /*
	  @RequestMapping("memberorderPagesend")
	  public String memberorderPagesend(RedirectAttributes redirectAttributes,HttpSession session,HttpServletRequest request, Model model) {
		  session = request.getSession();
		session.getAttribute("mDto");
		  model.addAttribute("request", request);
		  model.addAttribute("redirectAttributes",redirectAttributes);
		  orderBaseCommand = new DeliveryCommand();
		  orderBaseCommand.execute(sqlSession, model);
		  return "redirect:/order";
	  }
	  */
	  
	 /*
	  * redirect 는 mapping 한 번 더 확인 
	  */
	 
	 //배송정보 관련 여기까지
	 
	 //비회원 주문/배송조회
	 @RequestMapping("guestSearchPage")
	 public String guestSearchPage(Model model) {
		 return "guest/guestSearchPage";
	 }
	 
	 @RequestMapping("guestSearch")
		public String guestSearch(HttpServletRequest request,Model model) {
		    model.addAttribute("request", request);
			orderBaseCommand = new GuestOrderCommand();
			orderBaseCommand.execute(sqlSession, model);
			return "guest/guestOrder";
		}
	 
	 @RequestMapping("guestOderListview")
		public String guestOderListview(HttpServletRequest request,Model model) {
		 model.addAttribute("request", request);
			orderBaseCommand = new GuestOrderViewCommand();
			orderBaseCommand.execute(sqlSession, model);
			return "guest/guestOrderView";
		}
	
		
	 
	//주문정보입력하는 페이지
	 @RequestMapping("orderInsertPage")
	 public String orderInsertPage(HttpSession session,HttpServletRequest request) {
		 session = request.getSession();
		 session.getAttribute("mDto");
		 return "order/order";
	 }
	 
	 @RequestMapping("orderInsert")
		public String orderInsert(RedirectAttributes redirectAttributes,HttpServletRequest request, Model model) {
		   model.addAttribute("request", request);
			model.addAttribute("redirectAttributes",redirectAttributes);
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
