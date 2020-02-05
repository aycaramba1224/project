package com.koreait.foodit.command.orderBase;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;


import com.koreait.foodit.dao.OrderBaseDao;

public class MemberDeliveryCommand implements OrderBaseCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		// TODO Auto-generated method stub
		 OrderBaseDao orderDao = sqlSession.getMapper(OrderBaseDao.class);
			Map<String, Object> map = model.asMap();
			HttpServletRequest request = (HttpServletRequest) map.get("request");
			String delivery_name = request.getParameter("delivery_name");
			String delivery_phone = request.getParameter("delivery_phone");
			String delivery_phone2 = request.getParameter("delivery_phone2");
			String delivery_phone3 = request.getParameter("delivery_phone3");
			String order_post = request.getParameter("order_post");
			String order_road1 = request.getParameter("order_road1");
			
			orderDao.memberdeInsert(delivery_name, delivery_phone, delivery_phone2, delivery_phone3, order_post, order_road1);
			
			
			
			
			
				
			
		
			
			
         
	}

}
