package com.koreait.foodit.command.product;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.ProductDao;
import com.koreait.foodit.paging.Paging;

public class ProductSearchCommand implements ProductCommand { 

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		ProductDao productDao = sqlSession.getMapper(ProductDao.class);
		
		Map<String, Object> map = model.asMap();		
		HttpServletRequest request = (HttpServletRequest)map.get("request");		
		String query = request.getParameter("query");
		String content = "%" + request.getParameter("content") + "%"; 
		
		// 현재 페이지 번호 구하기 (파라미터로 전달)
		String currentPage = request.getParameter("currentPage");
		int nowPage = 1; // 기본 페이지 번호는 1로 정함
		if ( currentPage != null && !currentPage.isEmpty() ) {
			nowPage = Integer.parseInt(currentPage);
		}
		
		// 현재 페이지 번호를 알면
		// 현재 페이지에 표시되는 게시글을 시작 번호와 끝 번호를 알 수 있다.
		// 추가로 페이지 당 게시글 수(recordPerPage)를 알아야 한다.
		int recordPerPage = 8;
		int begin = (nowPage - 1) * recordPerPage + 1;
		int end = begin + recordPerPage - 1;
		
		// 전체 게시글 개수 구하기
		int totalRecord = productDao.totalCountProduct();
		
		// ◀ 1 2 3 ▶ 생성 (pagingView)
		String pagingView = Paging.getPaging("productList", nowPage, recordPerPage, totalRecord);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pagingView", pagingView);	 
		model.addAttribute("productList", productDao.productSearchResult(query, content, begin, end));
		model.addAttribute("productListSize", productDao.productSearchResult(query, content, begin, end).size());
		
	}

}
