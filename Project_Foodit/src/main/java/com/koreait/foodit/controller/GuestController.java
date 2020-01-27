package com.koreait.foodit.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.foodit.command.guest.GuestCommand;
import com.koreait.foodit.command.guest.GuestDeleteCommand;
import com.koreait.foodit.command.guest.GuestListCommand;
import com.koreait.foodit.command.guest.GuestinsertCommand;


@SessionAttributes("guest")
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
	
	@RequestMapping("guestInsertPage")
	public String guestInsertPage() {
		return "guest/guestInsertPage";
	}
	
	
	@RequestMapping("guestInsert")
	public String guestInsert(RedirectAttributes redirectAttributes,HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		guestCommand = new GuestinsertCommand();
		guestCommand.execute(sqlSession, model);
		return "redirect:/guestList";	//orderbase로 정보 넘어가게 처리해야함
		
	}
	
	@RequestMapping("guestDelete")
	public String guestDelete(RedirectAttributes redirectAttributes,HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		guestCommand = new GuestDeleteCommand();
		guestCommand.execute(sqlSession, model);
		return "redirect:/guestList";
	}
	
	
	
}
