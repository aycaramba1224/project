package com.koreait.foodit.command.product;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.foodit.dao.ProductDao;

public class ProductInsertCommand implements ProductCommand {
	
	@Override
	public void execute(SqlSession sqlSession, Model model) {

		ProductDao productDao = sqlSession.getMapper(ProductDao.class);
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int pro_no = Integer.parseInt(request.getParameter("pro_no"));		
		String pro_name = request.getParameter("pro_name");
		String pro_price = request.getParameter("pro_price");
		String pro_content = request.getParameter("pro_content");
		String pro_stock = request.getParameter("pro_stock");
		String pro_taste = request.getParameter("pro_taste");	 		
		
		RedirectAttributes redirectAttributes = (RedirectAttributes)map.get("redirectAttributes");
		redirectAttributes.addFlashAttribute("insertResult",	productDao.productInsert
				(pro_no, pro_name, pro_price, pro_content, pro_stock, pro_taste));

		redirectAttributes.addFlashAttribute("isProductInsert", "yes");
		

	}

}
