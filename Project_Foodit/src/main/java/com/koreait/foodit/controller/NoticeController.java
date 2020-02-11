package com.koreait.foodit.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.foodit.command.notice.NoticeCommand;
import com.koreait.foodit.command.notice.NoticeDeleteCommand;
import com.koreait.foodit.command.notice.NoticeListCommand;
import com.koreait.foodit.command.notice.NoticeModifyCommand;
import com.koreait.foodit.command.notice.NoticeQueryCommand;
import com.koreait.foodit.command.notice.NoticeViewCommand;
import com.koreait.foodit.command.notice.NoticeWriteCommand;

@Controller
public class NoticeController {

	 @Autowired
	 private SqlSession sqlSession;
	 private NoticeCommand noticeCommand;
		
	 
	@RequestMapping("noticeList")
	public String noticeList(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		noticeCommand = new NoticeListCommand(); 
		noticeCommand.execute(sqlSession, model);
		return "notice/noticeList"; 
	}
	 
	 
	 @RequestMapping("noticeView")
		public String view(HttpServletRequest request, Model model) {
			model.addAttribute("request", request);
			noticeCommand = new NoticeViewCommand(); 
			noticeCommand.execute(sqlSession, model);
			return"notice/noticeView";
		}
		
	 @RequestMapping("noticeWritePage")
		public String noticeWritePage() {
			return "notice/noticeWritePage";
		}
		
	 @RequestMapping("noticeWrite")
		public String noticeWrite(RedirectAttributes attributes,
				               HttpServletRequest request, 
				               Model model) {
			
			model.addAttribute("request", request);
			model.addAttribute("attributes",attributes);
			noticeCommand = new NoticeWriteCommand();
			noticeCommand.execute(sqlSession, model);
			return "redirect:/noticeList";
		}
		
	
	 @RequestMapping("noticeModifyPage")
	 	public String noticeModifyPage() {
		 return "notice/noticeModifyPage";
	 }
	 
	 @RequestMapping(value="noticeModify", method=RequestMethod.POST)
		public String noticeModify(RedirectAttributes attributes,
				                HttpServletRequest request,
				                Model model) {
			
			model.addAttribute("request", request);
			model.addAttribute("attributes", attributes);
			
			noticeCommand = new NoticeModifyCommand();
			noticeCommand.execute(sqlSession, model);
			return "redirect:/noticeList"; 
		}
	 @RequestMapping("noticeDelete")
		public String noticeDelete(RedirectAttributes attributes,
				             HttpServletRequest request,
				             Model model) {
			model.addAttribute("request", request);
			model.addAttribute("attributes", attributes);
			noticeCommand = new NoticeDeleteCommand();
			noticeCommand.execute(sqlSession, model);
			return "redirect:/noticeList";
		}
	 @RequestMapping(value="dynamicQuery", method=RequestMethod.POST)
		public String dynamic(HttpServletRequest request, Model model) {
			model.addAttribute("request", request);
			noticeCommand = new NoticeQueryCommand();
			noticeCommand.execute(sqlSession, model);
			return "notice/noticeList";
		}
		
	 
	 
}
