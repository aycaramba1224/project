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
		String order_road = request.getParameter("order_road");
		int order_no = Integer.parseInt(request.getParameter("order_no"));
		RedirectAttributes redirectAttributes = (RedirectAttributes)map.get("redirectAttributes");
		redirectAttributes.addFlashAttribute("orderModifyResult",orderDao.orderListModify(order_name,order_post,order_road,order_no));
		redirectAttributes.addFlashAttribute("orderBaseModifyResult","yes");
	}

}
