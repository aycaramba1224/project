package com.koreait.foodit.command.orderBase;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.CartDao;
import com.koreait.foodit.dao.OrderBaseDao;

public class AdminguestorderListCommand implements OrderBaseCommand {

	@Override
	public void execute(SqlSession sqlSession,Model model) {
		
       OrderBaseDao obDao = sqlSession.getMapper(OrderBaseDao.class);
       Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
	
	  
       model.addAttribute("adminGuestOrderList",obDao.adminGuestOrderList());
       model.addAttribute("adminGuestOrderListSize",obDao.adminGuestOrderList().size());
      System.out.println(obDao.adminGuestOrderList().size());
      
      /*
      CartDao  cDao = sqlSession.getMapper(CartDao.class);
		HttpSession session = request.getSession();	
		String cart_id = (String) session.getAttribute("cart_id");
		model.addAttribute(cDao.guestcartUPdate(cart_id));
		*/
	}
}