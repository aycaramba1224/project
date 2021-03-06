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
		
		// 카트의 insert와 update를 모두 처리한다.
		CartDao cartDao = sqlSession.getMapper(CartDao.class);
		 
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request"); 
			
		String cart_id = request.getParameter("cart_id");  		
		
		int product_no = Integer.parseInt(request.getParameter("product_no"));		
		int cart_amount = Integer.parseInt(request.getParameter("cart_amount"));	
	 
		int count = cartDao.cartCount(product_no);	// 동일한 상품번호를 가진 상품 수량 		
		if(count == 0) {	// 동일한 상품번호가 없는 경우 insert한다.
			RedirectAttributes redirectAttributes = (RedirectAttributes)map.get("redirectAttributes");
			redirectAttributes.addFlashAttribute("cartInsert", cartDao.cartInsert(cart_id, product_no, cart_amount));
		} else {			// 동일한 상품번호가 있는 경우 수량을 update한다.
			RedirectAttributes redirectAttributes = (RedirectAttributes)map.get("redirectAttributes");
			redirectAttributes.addFlashAttribute("cartUpdate", cartDao.cartUpdate(product_no, cart_amount));
		} 
 
	}
}