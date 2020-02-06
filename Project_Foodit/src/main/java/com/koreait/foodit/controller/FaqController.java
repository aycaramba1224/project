package com.koreait.foodit.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.foodit.command.faq.FaqCommand;
import com.koreait.foodit.command.faq.FaqDeleteCommand;
import com.koreait.foodit.command.faq.FaqListCommand;
import com.koreait.foodit.command.faq.FaqModifyCommand;
import com.koreait.foodit.command.faq.FaqSearchCommand;
import com.koreait.foodit.command.faq.FaqViewCommand;
import com.koreait.foodit.command.faq.FaqWriteCommand;

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


	
	@RequestMapping("faqView")
	public String view(HttpServletRequest request, Model model) {
		model.addAttribute("request", request); 
		faqCommand = new FaqViewCommand();
		faqCommand.execute(sqlSession, model);
		return "faq/faqView";
	}
	
	
	
	@RequestMapping(value="faqModify", method=RequestMethod.POST)
	public String faqModify(RedirectAttributes attributes,
			                HttpServletRequest request,
			                Model model) {
		
		model.addAttribute("request", request);
		model.addAttribute("attributes", attributes);
		
		faqCommand = new FaqModifyCommand();
		faqCommand.execute(sqlSession, model);
		return "redirect:faqList"; 
	}

	@RequestMapping("faqWritePage")
	public String faqWritePage() {
		return "faq/faqWritePage";
	}
	
	@RequestMapping(value="faqWrite", method = RequestMethod.POST)
	public String faqWrite(RedirectAttributes attributes,
			               HttpServletRequest request, 
			               Model model) {
		
		model.addAttribute("request", request);
		model.addAttribute("attributes",attributes);
		faqCommand = new FaqWriteCommand();
		faqCommand.execute(sqlSession, model);
		return "redirect:faqList";
	}
	
	
	
	@RequestMapping("faqDelete")
	public String faqDelete(RedirectAttributes attributes,
			             HttpServletRequest request,
			             Model model) {
		model.addAttribute("request", request);
		model.addAttribute("attributes", attributes);
		faqCommand = new FaqDeleteCommand();
		faqCommand.execute(sqlSession, model);
		return "redirect:faqList";
	}
	
	@RequestMapping(value="faqSearchResult", method=RequestMethod.POST)
	public String faqSearchresult(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		faqCommand = new FaqSearchCommand();
		faqCommand.execute(sqlSession, model);
		return "faq/faqList";
	}
	
	
	
	
}
