package com.koreait.foodit.command.cart;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.CartDao;

public class GuestOrderCartListCommand implements CartCommand {

	
	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		CartDao cDao = sqlSession.getMapper(CartDao.class);
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request"); 
		String cart_id = request.getParameter("cart_id");	
		int sumMoney = cDao.sumMoney(cart_id);			
		int fee = sumMoney >= 30000 ? 0 : 3000;		
		
		
		model.addAttribute("sumMoney", cDao.sumMoney(cart_id));		
		model.addAttribute("fee", fee);		 		
		model.addAttribute("GuestOrderCartList", cDao.guestordercartList(cart_id));
		model.addAttribute("GuestOrderCartListSize", cDao.guestordercartList(cart_id).size());
	}

}
