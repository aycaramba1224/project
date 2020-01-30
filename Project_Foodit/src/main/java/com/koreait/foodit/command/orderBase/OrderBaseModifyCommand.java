package com.koreait.foodit.command.orderBase;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.foodit.dao.OrderBaseDao;

public class OrderBaseModifyCommand implements OrderBaseCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		OrderBaseDao orderDao = sqlSession.getMapper(OrderBaseDao.class);
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String order_name = request.getParameter("order_name");
		String order_post = request.getParameter("order_post");
		String order_road1 = request.getParameter("order_road1");
		String order_road2 = request.getParameter("order_road2");
		String order_road3 = request.getParameter("order_road3");
		String order_phone = request.getParameter("order_phone");
		String order_id = request.getParameter("order_id");
		RedirectAttributes redirectAttributes = (RedirectAttributes)map.get("redirectAttributes");
		redirectAttributes.addFlashAttribute("orderModifyResult",orderDao.orderListModify(order_name, order_post, order_road1, order_road2, order_road3, order_phone, order_id));
		redirectAttributes.addFlashAttribute("orderBaseModifyResult","yes");
	}

}
