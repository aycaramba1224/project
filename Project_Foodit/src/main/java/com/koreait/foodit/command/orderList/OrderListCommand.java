package com.koreait.foodit.command.orderList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface OrderListCommand {
	
	public void execute(SqlSession sqlSession, Model model);
}
