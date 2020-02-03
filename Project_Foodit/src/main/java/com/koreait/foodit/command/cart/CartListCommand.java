package com.koreait.foodit.command.cart;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.CartDao;

public class CartListCommand implements CartCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
	
		CartDao cartDao = sqlSession.getMapper(CartDao.class);
		
		int sumMoney = cartDao.sumMoney();
		int fee = sumMoney >= 30000 ? 0 : 3000;
		
		model.addAttribute("sumMoney", cartDao.sumMoney());
		model.addAttribute("fee", fee);
		model.addAttribute("cartList", cartDao.cartList());
		model.addAttribute("cartListSize", cartDao.cartList().size());
		
	}
}
