package com.koreait.foodit.command.review;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface ReviewCommand {
	
	public void execute(SqlSession sqlSession, Model model);
}
