package com.koreait.foodit.command.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface MemberCommand {
	
	public void execute(SqlSession sqlSession, Model model);
}
