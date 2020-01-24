package com.koreait.foodit.command.memberOpt;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface MemberOptCommand {
	
	public void execute(SqlSession sqlSession, Model model);
}
