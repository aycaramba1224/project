package com.koreait.foodit.command.buy;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface BuyCommand {
	
	public void execute(SqlSession sqlSession, Model model);
}
