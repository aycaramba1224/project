package com.koreait.foodit.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.foodit.command.review.ReviewCommand;
import com.koreait.foodit.command.review.ReviewDeleteCommand;
import com.koreait.foodit.command.review.ReviewListCommand;
import com.koreait.foodit.command.review.ReviewModifyCommand;
import com.koreait.foodit.command.review.ReviewMyReviewCommand;
import com.koreait.foodit.command.review.ReviewSearchCommand;
import com.koreait.foodit.command.review.ReviewViewCommand;
import com.koreait.foodit.command.review.ReviewWriteCommand;
import com.koreait.foodit.command.review.ReviewWritePageCommand;

@Controller
public class ReviewController {

	@Autowired
	private SqlSession sqlSession;
	private ReviewCommand reviewCommand; 
	
	@RequestMapping("reviewList")
	public String reviewList(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		reviewCommand = new ReviewListCommand();
		reviewCommand.execute(sqlSession, model);
		return "review/reviewList";
	}
	
	@RequestMapping("reviewWritePage")
	public String reviewWritePage(HttpServletRequest request, Model model) {
		model.addAttribute("re_product_name", request.getParameter("re_product_name"));
		return "review/reviewWritePage";
	}
	
	@RequestMapping("reviewWrite")
	public String reviewWrite(RedirectAttributes redirectAttributes, 
								MultipartHttpServletRequest request, 
								Model model) {
		
		model.addAttribute("redirectAttributes", redirectAttributes);
		model.addAttribute("request", request); 
		reviewCommand = new ReviewWriteCommand();
		reviewCommand.execute(sqlSession, model);
		return "redirect:/reviewList";
	}
	
	@RequestMapping("reviewView")
	public String reviewView(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		reviewCommand = new ReviewViewCommand();
		reviewCommand.execute(sqlSession, model);
		return "review/reviewView";
	}
	
	@RequestMapping("reviewModifyPage")
	public String reviewModifyPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		reviewCommand = new ReviewViewCommand();
		reviewCommand.execute(sqlSession, model);
		return "review/reviewModifyPage";
	}
	
	@RequestMapping("reviewModify")
	public String reviewModify(RedirectAttributes redirectAttributes, MultipartHttpServletRequest request, Model model) {
		model.addAttribute("redirectAttributes", redirectAttributes);
		model.addAttribute("request", request);
		reviewCommand = new ReviewModifyCommand();
		reviewCommand.execute(sqlSession, model);
		return "redirect:/reviewList";
	}
	
	@RequestMapping("reviewDelete")
	public String reviewDelete(RedirectAttributes redirectAttributes,
							   HttpServletRequest request, 
							   Model model) {
		model.addAttribute("redirectAttributes", redirectAttributes);
		model.addAttribute("request", request); 
		reviewCommand = new ReviewDeleteCommand();
        reviewCommand.execute(sqlSession, model);
        return "redirect:/myReview";
	}
	
	@RequestMapping("reviewSearchResult")
	public String reviewSearchResult(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
        reviewCommand = new ReviewSearchCommand();
        reviewCommand.execute(sqlSession, model);
        return "review/reviewList";
	}
	
	@RequestMapping("myReview")
	public String myReview(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		reviewCommand = new ReviewMyReviewCommand();
		reviewCommand.execute(sqlSession, model);
		return "review/myReview";
	}
	
	
	
	@RequestMapping("reviewSearch")
	public String reviewSearch() {
		return "review/reviewSearchResult";
	}	
}