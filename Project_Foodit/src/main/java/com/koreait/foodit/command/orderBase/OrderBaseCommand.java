package com.koreait.foodit.command.orderBase;


import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface OrderBaseCommand {
	
	public void execute(SqlSession sqlSession, Model model);
}
