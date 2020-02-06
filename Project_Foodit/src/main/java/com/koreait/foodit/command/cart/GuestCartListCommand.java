package com.koreait.foodit.command.cart;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.CartDao;

public class GuestCartListCommand implements CartCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
	
		CartDao cartDao = sqlSession.getMapper(CartDao.class);
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request"); 
		HttpSession session = request.getSession();	
		
		String cart_id = (String) session.getAttribute("cart_id");
		
		System.out.println("아이디2 : " + cart_id);
	 	
	 	
	 
		int sumMoney = cartDao.sumMoney(cart_id);						// 동일한 회원의 장바구니 합계 금액 
		int fee = sumMoney >= 30000 ? 0 : 3000;
		
		model.addAttribute("sumMoney", cartDao.sumMoney(cart_id));		// 장바구니에 담긴 상품의 합계 금액 
		model.addAttribute("fee", fee);		 						// 합계금액이 30,000원 미만인 경우 배송비 3,000원 추가 
		model.addAttribute("guestCartList", cartDao.guestCartList());
		model.addAttribute("guestCartListSize", cartDao.guestCartList().size());
		
	}
}
