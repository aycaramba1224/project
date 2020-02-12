package com.koreait.foodit.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.foodit.command.product.BestListCommand;
import com.koreait.foodit.command.product.MenuListCommand;
import com.koreait.foodit.command.product.ProductCommand;
import com.koreait.foodit.command.product.TasteListCommand;

 
@Controller
public class MainController {
	
	@Autowired
	private SqlSession sqlSession;
	private ProductCommand productCommand;
 	
	// 실시간 베스트 리스트 
	@RequestMapping("main")			 
	public String main(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		productCommand = new BestListCommand(); 
		productCommand.execute(sqlSession, model);
		return "index";
	}  
	
	// 푸딧 메뉴보기 
	@RequestMapping("menuList")			 
	public String menuList(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		productCommand = new MenuListCommand();
		productCommand.execute(sqlSession, model);
		return "index";
	}  
	
	// 맛추천
	@RequestMapping("tasteList")
	public String tasteList(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		productCommand = new TasteListCommand();
		productCommand.execute(sqlSession, model);
		return "index";
	}
}