package com.koreait.foodit.controller;


import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.foodit.command.guest.GuestCommand;
import com.koreait.foodit.command.guest.GuestListCommand;
import com.koreait.foodit.command.guest.GuestinsertCommand;



@Controller
public class GuestController {

	@Autowired
	private SqlSession sqlSession;
	private GuestCommand guestCommand;

	
	@RequestMapping("guestList")
	public String guestList(HttpServletRequest request ,Model model) {
		model.addAttribute("request", request);
		guestCommand= new GuestListCommand();
		guestCommand.execute(sqlSession, model);
		return "guest/guestList";
		
	}
	
	
	@RequestMapping("guestInsert")
	public String guestInsertPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		guestCommand = new GuestinsertCommand();
		guestCommand.execute(sqlSession, model);
		return "redirect:/guestList";	
	}
	
	
}
