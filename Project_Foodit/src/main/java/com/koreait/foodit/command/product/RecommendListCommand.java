package com.koreait.foodit.command.product;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.ProductDao;

public class RecommendListCommand implements ProductCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		ProductDao productDao = sqlSession.getMapper(ProductDao.class);
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String product_taste = request.getParameter("product_taste");
		
		model.addAttribute("recommandList", productDao.recommendList(product_taste));

	}

}
