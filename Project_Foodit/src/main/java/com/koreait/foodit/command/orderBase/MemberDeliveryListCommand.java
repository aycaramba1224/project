package com.koreait.foodit.command.orderBase;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.OrderBaseDao;

public class MemberDeliveryListCommand implements OrderBaseCommand {

	@Override
	public void execute(SqlSession sqlSession,Model model) {
		// TODO Auto-generated method stub
       OrderBaseDao obDao = sqlSession.getMapper(OrderBaseDao.class);
       model.addAttribute("memberBaseList",obDao.memberDeliveryList());
       model.addAttribute("memberListSize",obDao.memberDeliveryList().size());
	}
}