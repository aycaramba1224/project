package com.koreait.foodit.command.faq;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface FaqCommand {
	
	public void execute(SqlSession sqlSession, Model model);
}
