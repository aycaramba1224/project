package com.koreait.foodit.command.guest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface GuestCommand {
	
	public void execute(SqlSession sqlSession, Model model);
}
