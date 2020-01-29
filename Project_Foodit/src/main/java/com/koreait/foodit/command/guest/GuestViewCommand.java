package com.koreait.foodit.command.guest;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.GuestDao;


public class GuestViewCommand implements GuestCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		GuestDao gDao = sqlSession.getMapper(GuestDao.class);
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int guest_no = Integer.parseInt(request.getParameter("guest_no"));
		model.addAttribute("guestDto",gDao.guestListView(guest_no));
	}

}
