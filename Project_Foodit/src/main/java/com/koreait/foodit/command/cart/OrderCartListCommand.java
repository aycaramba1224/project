package com.koreait.foodit.command.cart;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.CartDao;
import com.koreait.foodit.dto.MemberDto;

public class OrderCartListCommand implements CartCommand {

	
	@Override
	public void execute(SqlSession sqlSession, Model model) {
		// TODO Auto-generated method stub
		CartDao cDao = sqlSession.getMapper(CartDao.class);
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request"); 
		HttpSession session = request.getSession();
		
		MemberDto mDto = (MemberDto) session.getAttribute("mDto");		// 로그인 된 아이디를 받아서
	 	String cart_id = mDto.getId();
	 
	 	int sumMoney = cDao.sumMoney(cart_id);						// 동일한 회원의 장바구니 합계 금액 
		int fee = sumMoney >= 30000 ? 0 : 3000;
		
		model.addAttribute("sumMoney", cDao.sumMoney(cart_id));		// 장바구니에 담긴 상품의 합계 금액 
		model.addAttribute("fee", fee);				
	 	
		model.addAttribute("orderCartList", cDao.ordercartList(cart_id));
		model.addAttribute("orderCartListSize", cDao.ordercartList(cart_id).size());
		System.out.println(cDao.ordercartList(cart_id).size());
		
	}

}
