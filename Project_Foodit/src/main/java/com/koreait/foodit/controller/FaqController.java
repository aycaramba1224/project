package com.koreait.foodit.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.foodit.command.faq.FaqCommand;
import com.koreait.foodit.command.faq.FaqListCommand;
import com.koreait.foodit.command.product.ProductListCommand;

@Controller
public class FaqController {

	
	@Autowired
	private SqlSession sqlSession;
	private FaqCommand faqCommand;
	
	@RequestMapping("faqList")
	public String faqList(Model model) {
		faqCommand = new FaqListCommand(); 
		faqCommand.execute(sqlSession, model);
		return "faq/faqList";
	}

	

}
