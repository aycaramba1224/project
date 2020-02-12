package com.koreait.foodit.command.orderBase;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import com.koreait.foodit.dao.OrderBaseDao;



public class AdminguestorderListCommand implements OrderBaseCommand {

	@Override
	public void execute(SqlSession sqlSession,Model model) {
		
       OrderBaseDao obDao = sqlSession.getMapper(OrderBaseDao.class);
       Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String guest_pw =request.getParameter("guest_pw");
		model.addAttribute("guest",obDao.selectguest_pw(guest_pw));
		model.addAttribute("adminOrderList",obDao.adminOrderList());
		model.addAttribute("adminOrderListSize",obDao.adminOrderList().size());
		System.out.println(request.getParameter("guest_pw"));
		System.out.println(obDao.adminOrderList().size());
		
		 
		 
      
     
		
	}
}