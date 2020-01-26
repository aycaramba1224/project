package com.koreait.foodit.command.cart;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.CartDao;

public class CartListCommand implements CartCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		CartDao cartDao = sqlSession.getMapper(CartDao.class);
		
		model.addAttribute("cartList", cartDao.cartList());
		model.addAttribute("cartListSize", cartDao.cartList().size());

	}

}
