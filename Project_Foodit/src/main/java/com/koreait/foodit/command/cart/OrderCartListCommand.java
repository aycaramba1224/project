package com.koreait.foodit.command.cart;


import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.CartDao;

public class OrderCartListCommand implements CartCommand {

	
	@Override
	public void execute(SqlSession sqlSession, Model model) {
		// TODO Auto-generated method stub
		CartDao cDao = sqlSession.getMapper(CartDao.class);
		
		model.addAttribute("orderCartList", cDao.ordercartList());
		model.addAttribute("orderCartListSize", cDao.ordercartList().size());
		System.out.println(cDao.ordercartList().size());
		
	}

}
