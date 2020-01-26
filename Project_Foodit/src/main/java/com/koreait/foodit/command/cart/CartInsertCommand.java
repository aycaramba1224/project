package com.koreait.foodit.command.cart;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.CartDao;

public class CartInsertCommand implements CartCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		CartDao cartDao = sqlSession.getMapper(CartDao.class);
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int cart_no = Integer.parseInt(request.getParameter("cart_no"));
		String id = request.getParameter("id");
		int pro_no = Integer.parseInt(request.getParameter("pro_no"));
		int cart_amount = Integer.parseInt(request.getParameter("cart_amount"));
		

	}

}
