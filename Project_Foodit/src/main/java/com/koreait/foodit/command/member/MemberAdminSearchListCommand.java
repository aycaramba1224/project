package com.koreait.foodit.command.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.MemberDao;

public class MemberAdminSearchListCommand implements MemberCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		MemberDao mDao = sqlSession.getMapper(MemberDao.class);
		model.addAttribute("list", mDao.adminMemberList());
		model.addAttribute("listSize", mDao.adminMemberList().size());
	}

}
