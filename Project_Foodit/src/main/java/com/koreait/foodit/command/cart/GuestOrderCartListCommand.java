package com.koreait.foodit.command.cart;



import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.CartDao;

public class GuestOrderCartListCommand implements CartCommand {

	
	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		CartDao cDao = sqlSession.getMapper(CartDao.class);
		
		model.addAttribute("GuestOrderCartList", cDao.guestordercartList());
		model.addAttribute("GuestOrderCartListSize", cDao.guestordercartList().size());
	}

}
