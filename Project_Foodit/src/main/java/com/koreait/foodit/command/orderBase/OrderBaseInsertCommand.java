package com.koreait.foodit.command.orderBase;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.CartDao;
import com.koreait.foodit.dao.OrderBaseDao;
import com.koreait.foodit.dto.MemberDto;



public class OrderBaseInsertCommand implements OrderBaseCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		// TODO Auto-generated method stub

	        OrderBaseDao orderDao = sqlSession.getMapper(OrderBaseDao.class);
			Map<String, Object> map = model.asMap();
			HttpServletRequest request = (HttpServletRequest) map.get("request");
			String guest_pw = request.getParameter("guest_pw");
			String order_name = request.getParameter("order_name");
			String order_phone = request.getParameter("order_phone");
			String order_phone2 = request.getParameter("order_phone2");
			String order_phone3 = request.getParameter("order_phone3");
			String order_email =request.getParameter("order_email");
			String order_email2 =request.getParameter("order_email2");
			
			String delivery_name = request.getParameter("delivery_name");
			String delivery_phone = request.getParameter("delivery_phone");
			String delivery_phone2 = request.getParameter("delivery_phone2");
			String delivery_phone3 = request.getParameter("delivery_phone3");
			String order_post = request.getParameter("order_post");
			String order_road1 = request.getParameter("order_road1");
			
			orderDao.orderInsert(guest_pw, order_name, order_phone, order_phone2, order_phone3, order_email, order_email2, 
												delivery_name, delivery_phone, delivery_phone2, delivery_phone3, order_post, order_road1);
			
			CartDao  cDao = sqlSession.getMapper(CartDao.class);
			model.addAttribute("gOrderDao", cDao.guestcartUPdate());
			
	}

}
