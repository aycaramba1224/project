package com.koreait.foodit.command.orderBase;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.OrderBaseDao;

public class MemberDeliveryListCommand implements OrderBaseCommand {

	@Override
	public void execute(SqlSession sqlSession,Model model) {
		// TODO Auto-generated method stub
       OrderBaseDao obDao = sqlSession.getMapper(OrderBaseDao.class);
       Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
       String delivery_name =request.getParameter("delivery_name");
       int order_no =Integer.parseInt(request.getParameter("order_no"));
       model.addAttribute("mODto",obDao.memberDeliveryList(delivery_name,order_no));
	}
}