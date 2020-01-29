package com.koreait.foodit.controller;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.foodit.command.guest.GuestCommand;
import com.koreait.foodit.command.guest.GuestDeleteCommand;
import com.koreait.foodit.command.guest.GuestListCommand;
import com.koreait.foodit.command.guest.GuestModifyCommand;
import com.koreait.foodit.command.guest.GuestViewCommand;
import com.koreait.foodit.command.guest.GuestinsertCommand;
import com.koreait.foodit.command.orderBase.OrderBaseDeleteCommand;
import com.koreait.foodit.command.orderBase.OrderBaseViewCommand;


@Controller
public class GuestController {

	@Autowired
	private SqlSession sqlSession;
	private GuestCommand guestCommand;


	@RequestMapping("guestList")
	public String guestList(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		guestCommand= new GuestListCommand();
		guestCommand.execute(sqlSession, model);
		return "guest/guestList";
	}

@RequestMapping("guestInsertPage")
	public String guestInsertPage(Model model) {
		return "guest/guestInsertPage";
	}
	
	@RequestMapping("guestInsert")
	public String guestInsert(RedirectAttributes redirectAttributes,HttpServletRequest request,Model model) {
		model.addAttribute("request", request);
		model.addAttribute("redirectAttributes",redirectAttributes);
		guestCommand = new GuestinsertCommand();
		guestCommand.execute(sqlSession, model);
		return "redirect:/guestList";
		
	}
	@RequestMapping("guestListview")
	public String guestListview(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		guestCommand =  new GuestViewCommand();
		guestCommand.execute(sqlSession, model);
		return "guest/guestViewPage";
	}
	
	@RequestMapping("guestModify")
	public String guestModify(RedirectAttributes redirectAttributes,HttpServletRequest request, Model model){
		model.addAttribute("request", request);
		model.addAttribute("redirectAttributes",redirectAttributes);
		guestCommand = new GuestModifyCommand();
		guestCommand.execute(sqlSession, model);
		return "redirect:/guestList";
	}
	
	@RequestMapping("guestDelete")
	public String guestDelete(RedirectAttributes redirectAttributes,HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("redirectAttributes",redirectAttributes);
		guestCommand = new GuestDeleteCommand();
		guestCommand.execute(sqlSession, model);
		return "redirect:/guestList";
}
}