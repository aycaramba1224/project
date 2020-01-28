package com.koreait.foodit.command.orderBase;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.foodit.dao.GuestDao;
import com.koreait.foodit.dao.OrderBaseDao;

public class OrderBaseInsertCommand implements OrderBaseCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		// TODO Auto-generated method stub

	       OrderBaseDao orderDao = sqlSession.getMapper(OrderBaseDao.class);
	   
			Map<String, Object> map = model.asMap();
			HttpServletRequest request = (HttpServletRequest) map.get("request");
			
			int guest_no = Integer.parseInt(request.getParameter("guest_no"));
			int order_no = Integer.parseInt(request.getParameter("order_no"));
			String order_name = request.getParameter("order_name");
			String order_post = request.getParameter("order_post");
			String order_road = request.getParameter("order_road");
			
			RedirectAttributes redirectAttributes = (RedirectAttributes)map.get(" redirectAttributes");
            model.addAttribute("orderList",orderDao.orderInsert(order_no, order_name, order_post, order_road));
            model.addAttribute("guest_no", orderDao.order_noView(guest_no));
			
	}

}
