package com.koreait.foodit.command.orderBase;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.OrderBaseDao;

public class OrderBaseListCommand implements OrderBaseCommand {

	@Override
	public void execute(SqlSession sqlSession,Model model) {
		// TODO Auto-generated method stub
       OrderBaseDao obDao = sqlSession.getMapper(OrderBaseDao.class);
       model.addAttribute("orderBaseList",obDao.orderList());
       model.addAttribute("orderBaseListSize",obDao.orderList().size());
	}
}