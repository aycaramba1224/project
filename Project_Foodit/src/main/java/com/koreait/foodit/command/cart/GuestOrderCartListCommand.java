package com.koreait.foodit.command.cart;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.CartDao;

public class GuestOrderCartListCommand implements CartCommand {

	
	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		CartDao cDao = sqlSession.getMapper(CartDao.class);
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request"); 
		HttpSession session = request.getSession();	
		 
		String cart_id = (String) session.getAttribute("cart_id");		// 비회원의 경우에는 임시로  세션아이디를 부여해줌
		int sumMoney = cDao.sumMoney(cart_id);						// 동일한 회원의 장바구니 합계 금액 
		int fee = sumMoney >= 30000 ? 0 : 3000;		
		
		
		model.addAttribute("sumMoney", cDao.sumMoney(cart_id));		// 장바구니에 담긴 상품의 합계 금액 
		model.addAttribute("fee", fee);		 		
		model.addAttribute("GuestOrderCartList", cDao.guestordercartList(cart_id));
		model.addAttribute("GuestOrderCartListSize", cDao.guestordercartList(cart_id).size());
	}

}
