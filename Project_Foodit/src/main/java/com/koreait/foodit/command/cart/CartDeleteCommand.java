package com.koreait.foodit.command.cart;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.CartDao;

public class CartDeleteCommand implements CartCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		CartDao cartDao = sqlSession.getMapper(CartDao.class);
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		int cart_no = Integer.parseInt(request.getParameter("cart_no"));	// 카트번호(PK)를 통해서 일치하는 카트 번호 삭제
	 
		model.addAttribute("cartDelete", cartDao.cartDelete(cart_no));
	
	}

}
