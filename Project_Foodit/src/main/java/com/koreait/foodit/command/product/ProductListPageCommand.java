package com.koreait.foodit.command.product;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.ProductDao;

public class ProductListPageCommand implements ProductCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		ProductDao productDao = sqlSession.getMapper(ProductDao.class);	
		
		Map<String, Object> map2 = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map2.get("request"); 
		
		String currentPage = request.getParameter("currentPage");
		int nowPage = 1; // 기본 페이지 번호는 1로 정함
		if ( currentPage != null && !currentPage.isEmpty() ) {
			nowPage = Integer.parseInt(currentPage);
		}
		 
		
		// 게시물 총 갯수
		int count = productDao.productCount();
		
		// 한 페이지에 출력할 게시물 갯수
		int recordPerPage = 10;
		
		// 출력할 게시물
		int begin = (nowPage - 1) * recordPerPage + 1;

		// 하단 페이징 번호 ([ 게시물 총 갯수 ÷ 한 페이지에 출력할 갯수 ]의 올림)
		int end = begin + recordPerPage - 1;
				  
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		
		 
		
		
		model.addAttribute("productListPage", productDao.productListPage(begin, end));
		model.addAttribute("end", end);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("begin", begin);
		model.addAttribute("currentPage", currentPage);

	}

}
