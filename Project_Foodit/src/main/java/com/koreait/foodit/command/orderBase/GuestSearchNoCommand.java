package com.koreait.foodit.command.orderBase;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;


import com.koreait.foodit.dao.OrderBaseDao;

public class GuestSearchNoCommand implements OrderBaseCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		// TODO Auto-generated method stub
		OrderBaseDao orderDao = sqlSession.getMapper(OrderBaseDao.class);
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String guestquery = request.getParameter("guestquery");
		String content = "%" + request.getParameter("content") + "%";
		
		model.addAttribute("guestOrderList", orderDao.findno(guestquery, content));
		model.addAttribute("guestOrderListSize", orderDao.findno(guestquery, content).size());
		
		
		
		
	}

}
