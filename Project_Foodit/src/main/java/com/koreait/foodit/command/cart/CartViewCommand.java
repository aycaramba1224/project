package com.koreait.foodit.command.cart;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.CartDao;

public class CartViewCommand implements CartCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		CartDao cartDao = sqlSession.getMapper(CartDao.class);
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int pro_no = Integer.parseInt(request.getParameter("pro_no"));
		
		
		model.addAttribute("cartView", cartDao.cartView(pro_no));
		model.addAttribute("cartViewSize", cartDao.cartView(pro_no).size());
		
	}

}
