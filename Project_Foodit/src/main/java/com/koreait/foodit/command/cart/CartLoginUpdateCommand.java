package com.koreait.foodit.command.cart;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.CartDao;

public class CartLoginUpdateCommand implements CartCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
 
		CartDao cartDao = sqlSession.getMapper(CartDao.class);
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String cart_id = request.getParameter("cart_id");
		int cart_no = Integer.parseInt(request.getParameter("cart_no"));
		
		model.addAttribute("cartLoginUpdate", cartDao.cartLoginUpdate(cart_id, cart_no));
		
	}

}
