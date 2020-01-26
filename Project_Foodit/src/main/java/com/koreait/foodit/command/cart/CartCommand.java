package com.koreait.foodit.command.cart;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface CartCommand {
	
	public void execute(SqlSession sqlSession, Model model);
}
