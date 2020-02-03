package com.koreait.foodit.command.orderBase;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;

import org.springframework.ui.Model;
import com.koreait.foodit.dao.OrderBaseDao;


public class GuestOrderViewCommand2 implements OrderBaseCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		// TODO Auto-generated method stub
		OrderBaseDao orderBDao = sqlSession.getMapper(OrderBaseDao.class);
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int order_no =Integer.parseInt(request.getParameter("order_no"));
		model.addAttribute("orderBaseDto",orderBDao.guestorderList_view(order_no));
		
	}

}
