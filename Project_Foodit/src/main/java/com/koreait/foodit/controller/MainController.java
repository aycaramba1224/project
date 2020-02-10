package com.koreait.foodit.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.foodit.command.product.MainListCommand;
import com.koreait.foodit.command.product.ProductCommand;
 
@Controller
public class MainController {
	
	@Autowired
	private SqlSession sqlSession;
	private ProductCommand productCommand;
	
	@RequestMapping("main")			// 만족도순 정렬 리스트 (임시로 재고순으로 넣음)
	public String main(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		productCommand = new MainListCommand();
		productCommand.execute(sqlSession, model);
		return "index";
	}  
	

}
