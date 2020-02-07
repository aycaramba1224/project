package com.koreait.foodit.command.orderBase;


import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.OrderBaseDao;


public class OrderCartListCommand implements OrderBaseCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		// TODO Auto-generated method stub
		OrderBaseDao orderDao = sqlSession.getMapper(OrderBaseDao.class);
		//Map<String, Object> map = model.asMap();
		//HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		/*
		int sumMoney = orderDao.sumMoney(id);						// 동일한 회원의 장바구니 합계 금액 
		int fee = sumMoney >= 30000 ? 0 : 3000;
		model.addAttribute("sumMoney", orderDao.sumMoney(id));		// 장바구니에 담긴 상품의 합계 금액 
		model.addAttribute("fee", fee);	
		*/
		
		//HttpSession seesion = request.getSession();
		//MemberDto mDto = (MemberDto)seesion.getAttribute("mDto");
		//String id = mDto.getId();
		
		model.addAttribute("orderCartList", orderDao.ordercartList());
	}

}
