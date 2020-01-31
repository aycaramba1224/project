package com.koreait.foodit.command.guest;

import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.foodit.dao.GuestDao;
import com.koreait.foodit.dto.GuestDto;

public class GuestinsertCommand implements GuestCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		// TODO Auto-generated method stub
       GuestDao gDao = sqlSession.getMapper(GuestDao.class);

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String guest_id = request.getParameter("guest_id");		
		String guest_pw = request.getParameter("guest_pw");
		String guest_name = request.getParameter("guest_name");
		String guest_phone = request.getParameter("guest_phone");
		
		RedirectAttributes redirectAttributes = (RedirectAttributes)map.get("redirectAttributes");
		redirectAttributes.addFlashAttribute("guestResult",gDao.guestInsert(guest_id, guest_pw, guest_name, guest_phone));
		redirectAttributes.addFlashAttribute("guestInsertResult","yes");
		
		}

     
		
	}

