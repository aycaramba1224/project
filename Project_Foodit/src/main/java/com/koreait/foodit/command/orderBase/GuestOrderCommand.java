package com.koreait.foodit.command.orderBase;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.OrderBaseDao;

public class GuestOrderCommand implements OrderBaseCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		OrderBaseDao orderBDao = sqlSession.getMapper(OrderBaseDao.class);
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String guestquery = request.getParameter("guestquery");
		String content = "%" + request.getParameter("content") + "%";
		
		String guestquery2 = request.getParameter("guestquery2");
		String content2 = "%" + request.getParameter("content2") + "%";
		model.addAttribute("guestList", orderBDao.guestOrder(guestquery, content));
		model.addAttribute("guestListSize", orderBDao.guestOrder(guestquery, content).size());
		model.addAttribute("guest_noList",orderBDao.guest_noOrder(guestquery2,content2));
		model.addAttribute("guest_noListSize",orderBDao.guest_noOrder(guestquery2,content2).size());
		
	}

}
