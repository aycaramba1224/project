package com.koreait.foodit.command.orderBase;



import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.OrderBaseDao;

public class MemberOrderListCommand implements OrderBaseCommand {

	@Override
	public void execute(SqlSession sqlSession,Model model) {
		// TODO Auto-generated method stub
       OrderBaseDao obDao = sqlSession.getMapper(OrderBaseDao.class);
      
       model.addAttribute("memberOrderList",obDao.memberordercartList());
    
	}
}