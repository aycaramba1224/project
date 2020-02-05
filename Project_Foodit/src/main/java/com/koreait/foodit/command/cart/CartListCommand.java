package com.koreait.foodit.command.cart;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.CartDao;
import com.koreait.foodit.dto.MemberDto;

public class CartListCommand implements CartCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
	
		CartDao cartDao = sqlSession.getMapper(CartDao.class);
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request"); 
		HttpSession session = request.getSession();
		
	 	MemberDto mDto = (MemberDto) session.getAttribute("mDto");		// 로그인 된 아이디를 받아서
	 	String id = mDto.getId();
		String cart_id =  id;											// 카트에 연결된 id에 저장 -> id에 따라서 장바구니가 따라감 
		
	 
		int sumMoney = cartDao.sumMoney(cart_id);						// 동일한 회원의 장바구니 합계 금액 
		int fee = sumMoney >= 30000 ? 0 : 3000;
		
		model.addAttribute("sumMoney", cartDao.sumMoney(cart_id));		// 장바구니에 담긴 상품의 합계 금액 
		model.addAttribute("fee", fee);									// 합계금액이 30,000원 미만인 경우 배송비 3,000원 추가 
		model.addAttribute("cartList", cartDao.cartList(cart_id));
		model.addAttribute("cartListSize", cartDao.cartList(cart_id).size());
		
	}
}
