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
				
		String pro_name = request.getParameter("pro_name");
		String pro_price = request.getParameter("pro_price");
		String pro_content = request.getParameter("pro_content");
		String pro_stock = request.getParameter("pro_stock");
		String pro_taste = request.getParameter("pro_taste");
		int pro_no =  Integer.parseInt(request.getParameter("pro_no"));
		
		RedirectAttributes redirectAttributes = (RedirectAttributes)map.get("redirectAttributes");
		redirectAttributes.addFlashAttribute("modifyResult", productDao.productModify(pro_name, pro_price, pro_content, pro_stock, pro_taste, pro_no) );
		redirectAttributes.addFlashAttribute("isModify", "yes");	// 변수명 수정예정

	}

}
