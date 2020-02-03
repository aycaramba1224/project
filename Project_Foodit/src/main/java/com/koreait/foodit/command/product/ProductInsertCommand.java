package com.koreait.foodit.command.product;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.foodit.dao.ProductDao;

public class ProductInsertCommand implements ProductCommand {
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	
	@Override
	public void execute(SqlSession sqlSession, Model model) {

		ProductDao productDao = sqlSession.getMapper(ProductDao.class);
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		 
		String product_name = request.getParameter("product_name");
		String product_price = request.getParameter("product_price");
		String product_content = request.getParameter("product_content");
		String product_stock = request.getParameter("product_stock");
		String product_taste = request.getParameter("product_taste");	 		
	 
		
		RedirectAttributes redirectAttributes = (RedirectAttributes)map.get("redirectAttributes");
		redirectAttributes.addFlashAttribute("insertResult", productDao.productInsert(product_name, product_price, product_content, 
				product_stock, product_taste));
		redirectAttributes.addFlashAttribute("isProductInsert", "yes");
 
	}

}
