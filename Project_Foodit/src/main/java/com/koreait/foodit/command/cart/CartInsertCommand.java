package com.koreait.foodit.command.cart;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.foodit.dao.CartDao;

public class CartInsertCommand implements CartCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
	
	CartDao cartDao = sqlSession.getMapper(CartDao.class);
	 
	Map<String, Object> map = model.asMap();
	HttpServletRequest request = (HttpServletRequest) map.get("request"); 
		 
	String cart_id = request.getParameter("cart_id");
	int product_no = Integer.parseInt(request.getParameter("product_no"));		
	int cart_amount = Integer.parseInt(request.getParameter("cart_amount"));	
	
	
	 
	int count = cartDao.cartCount(product_no);
	
	if(count == 0) {
		RedirectAttributes redirectAttributes = (RedirectAttributes)map.get("redirectAttributes");
		redirectAttributes.addFlashAttribute("cartInsertResult", cartDao.cartInsert(cart_id, product_no, cart_amount));
	} else {
		RedirectAttributes redirectAttributes = (RedirectAttributes)map.get("redirectAttributes");
		redirectAttributes.addFlashAttribute("cartUpdate", cartDao.cartUpdate(product_no, cart_amount));
	} 
	
	
	
	 /*
	RedirectAttributes redirectAttributes = (RedirectAttributes)map.get("redirectAttributes");
	redirectAttributes.addFlashAttribute("cartInsertResult", cartDao.cartInsert(cart_id, product_no, cart_amount));*/
 
	}
}