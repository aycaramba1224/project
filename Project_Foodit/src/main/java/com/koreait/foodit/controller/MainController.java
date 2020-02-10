package com.koreait.foodit.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.foodit.command.product.BestListCommand;
import com.koreait.foodit.command.product.ProductCommand;
import com.koreait.foodit.command.product.RecommendListCommand;
 
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
	
	// 맛추천 리스트
	@RequestMapping("recommendList")
	public String recommendList(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		productCommand = new RecommendListCommand();
		productCommand.execute(sqlSession, model);
		return "main/recommendList";
	}
 

}
