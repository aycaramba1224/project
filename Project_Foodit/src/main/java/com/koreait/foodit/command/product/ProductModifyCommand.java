package com.koreait.foodit.command.product;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.foodit.dao.ProductDao;

public class ProductModifyCommand implements ProductCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		 
		ProductDao productDao = sqlSession.getMapper(ProductDao.class);
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
				
		String product_name = request.getParameter("product_name");
		int product_price = Integer.parseInt(request.getParameter("product_price"));
		String product_taste = request.getParameter("product_taste");
		String product_stock = request.getParameter("product_stock");
		String product_content = request.getParameter("product_content");
		int product_no =  Integer.parseInt(request.getParameter("product_no"));
		
		RedirectAttributes redirectAttributes = (RedirectAttributes)map.get("redirectAttributes");
		redirectAttributes.addFlashAttribute("modifyResult", productDao.productModify
											(product_name, product_price, product_taste, product_stock, product_content, product_no) );
		redirectAttributes.addFlashAttribute("isProductModify", "yes");	 

	}

}
