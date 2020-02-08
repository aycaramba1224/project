package com.koreait.foodit.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.foodit.command.product.ProductCommand;
import com.koreait.foodit.command.product.ProductDeleteCommand;
import com.koreait.foodit.command.product.ProductInsertCommand;
import com.koreait.foodit.command.product.ProductListCommand;
import com.koreait.foodit.command.product.ProductListOrder1Command;
import com.koreait.foodit.command.product.ProductListOrder2Command;
import com.koreait.foodit.command.product.ProductListOrder3Command;
import com.koreait.foodit.command.product.ProductListOrder4Command;
import com.koreait.foodit.command.product.ProductModifyCommand;
import com.koreait.foodit.command.product.ProductSearchCommand;
import com.koreait.foodit.command.product.ProductViewCommand;

@Controller
public class ProductController {

	@Autowired
	private SqlSession sqlSession;
	private ProductCommand productCommand;
		
	// 기본 CRUD
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
	public String productInsert(RedirectAttributes redirectAttributes, MultipartHttpServletRequest request, Model model) {
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
	
	@RequestMapping("productModifyPage")
	public String productModifyPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		productCommand = new ProductViewCommand();
		productCommand.execute(sqlSession, model);
		return "product/productModifyPage";
	}
	
	@RequestMapping("productModify")
	public String modify(RedirectAttributes redirectAttributes, MultipartHttpServletRequest request, Model model) {		
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
	
	 
	// 상품 정렬
	@RequestMapping("productListOrder1")			// 가격 내림 차순 정렬 리스트 (높은가격 순)
	public String productListOrder1(Model model) {	
		productCommand = new ProductListOrder1Command();
		productCommand.execute(sqlSession, model);
		return "product/productListOrder1";
	}
		
	@RequestMapping("productListOrder2")			// 가격 내림 차순 정렬 리스트 (높은가격 순)
	public String productListOrder2(Model model) {	
		productCommand = new ProductListOrder2Command();
		productCommand.execute(sqlSession, model);
		return "product/productListOrder2";
	} 
	@RequestMapping("productListOrder3")			// 가격 오름 차순 정렬 리스트 (낮은가격 순)
	public String productListOrder3(Model model) {	
		productCommand = new ProductListOrder3Command();
		productCommand.execute(sqlSession, model);
		return "product/productListOrder3";
	} 
	
	@RequestMapping("productListOrder4")			// 만족도순 정렬 리스트 (임시로 재고순으로 넣음)
	public String productListOrder4(Model model) {	
		productCommand = new ProductListOrder4Command();
		productCommand.execute(sqlSession, model);
		return "product/productListOrder4";
	}  
	
	
	// 메뉴 찾기 페이지 
	@RequestMapping("productSearchResult")
	public String dynamic(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		productCommand = new ProductSearchCommand();
		productCommand.execute(sqlSession, model);
		return "product/productSearchResult";
	}
	
	@RequestMapping("productSearch")
	public String productSearch() {
		return"product/productSearchResult";
	}
 

	
	
	
	
	
	
	
	
	
	
	
}
