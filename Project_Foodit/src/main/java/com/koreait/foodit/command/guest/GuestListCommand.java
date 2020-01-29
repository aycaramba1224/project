package com.koreait.foodit.command.guest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import com.koreait.foodit.dao.GuestDao;


public class GuestListCommand implements GuestCommand {

	@Override
	public void execute(SqlSession sqlSession,Model model) {
		// TODO Auto-generated method stub
		GuestDao gDao = sqlSession.getMapper(GuestDao.class);
		model.addAttribute("guestList", gDao.guestList());
		model.addAttribute("guestListSize", gDao.guestList().size());
		
	}

}
