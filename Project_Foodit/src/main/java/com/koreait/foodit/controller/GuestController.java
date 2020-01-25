package com.koreait.foodit.controller;


import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.foodit.command.guest.GuestCommand;
import com.koreait.foodit.command.guest.GuestinsertCommand;
import com.koreait.foodit.command.product.ProductCommand;


@Controller
public class GuestController {

	@Autowired
	private SqlSession sqlSession;
	private GuestCommand guestCommand;

	@RequestMapping("guestindex")
	public String guestindexPage(Model model) {
		return "guest/guestindex";
	}
	
	@RequestMapping("guestInsert")
	public String guestInsertPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		guestCommand = new GuestinsertCommand();
		guestCommand.execute(sqlSession, model);
		return "redirect:/guestindex";
	}
	
	
}
