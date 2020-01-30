package com.koreait.foodit.command.guest;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.foodit.dao.GuestDao;

public class GuestDeleteCommand implements GuestCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		GuestDao gDao = sqlSession.getMapper(GuestDao.class);
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String guest_id = request.getParameter("guest_id");
		RedirectAttributes redirectAttributes = (RedirectAttributes)map.get("redirectAttributes");
		redirectAttributes.addFlashAttribute("deleteResult",gDao.guestDelete(guest_id));
		redirectAttributes.addFlashAttribute("guestDeleteResult","yes" );


	}

}
