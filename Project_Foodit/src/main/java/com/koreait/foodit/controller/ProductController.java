package com.koreait.foodit.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.foodit.command.product.ProductCommand;
import com.koreait.foodit.command.product.ProductDeleteCommand;
import com.koreait.foodit.command.product.ProductInsertCommand;
import com.koreait.foodit.command.product.ProductListCommand;
import com.koreait.foodit.command.product.ProductModifyCommand;
import com.koreait.foodit.command.product.ProductQueryCommand;
import com.koreait.foodit.command.product.ProductViewCommand;

@Controller
public class ProductController {

	@Autowired
	private SqlSession sqlSession;
	private ProductCommand productCommand;
	
	@RequestMapping("productList")
	public String productList(Model model) {
		productCommand = new ProductListCommand();
		productCommand.execute(sqlSession, model);
		return "product/productList";
	}
	
	@RequestMapping("productInsertPage")
	public String productInsertPage() {
		return"product/productInsertPage";
	}
	
	@RequestMapping("productInsert")
	public String productInsert(RedirectAttributes redirectAttributes, HttpServletRequest request,
								Model model	) {
		model.addAttribute("redirectAttributes", redirectAttributes);
		model.addAttribute("request", request);
		productCommand = new ProductInsertCommand();
		productCommand.execute(sqlSession, model);
		return "redirect:/productList";		
	}

	@RequestMapping("productView")
	public String productView(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		productCommand = new ProductViewCommand();
		productCommand.execute(sqlSession, model);
		return "product/productView";
	}
	
	@RequestMapping("productModify")
	public String modify(RedirectAttributes redirectAttributes,HttpServletRequest request, Model model) {		
		model.addAttribute("redirectAttributes", redirectAttributes);
		model.addAttribute("request", request);
		productCommand = new ProductModifyCommand();
		productCommand.execute(sqlSession, model);
		return "redirect:/productList";
	}
	
	@RequestMapping("productDelete")
	public String delete(RedirectAttributes redirectAttributes,HttpServletRequest request, Model model) {
		model.addAttribute("redirectAttributes", redirectAttributes);
		model.addAttribute("request", request);
		productCommand = new ProductDeleteCommand();
		productCommand.execute(sqlSession, model);
		return "redirect:/productList";
	}
	@RequestMapping("dynamicQuery")
	public String dynamic(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		productCommand = new ProductQueryCommand();
		productCommand.execute(sqlSession, model);
		return "product/productList";
	}
}
