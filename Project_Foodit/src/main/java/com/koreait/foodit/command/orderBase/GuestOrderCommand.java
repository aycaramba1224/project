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
		String order_phone2 = request.getParameter("order_phone2");
		String guest_pw = request.getParameter("guest_pw");
		model.addAttribute("gDto", orderBDao.guestOrderList(order_phone2, guest_pw));
		
		 
	}

}
