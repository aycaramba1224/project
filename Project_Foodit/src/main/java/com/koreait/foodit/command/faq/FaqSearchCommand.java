package com.koreait.foodit.command.faq;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.FaqDao;
import com.koreait.foodit.dto.FaqDto;
import com.koreait.foodit.paging.Paging;

public class FaqSearchCommand implements FaqCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
      FaqDao fDao = sqlSession.getMapper(FaqDao.class); 
       
      Map<String, Object> map = model.asMap();
      HttpServletRequest request = (HttpServletRequest)map.get("request");
      	
      // 현재 페이지 번호 구하기 (파라미터로 전달)
   		String currentPage = request.getParameter("currentPage");
   		int nowPage = 1; // 기본 페이지 번호는 1로 정함
   		if ( currentPage != null && !currentPage.isEmpty() ) {
   			nowPage = Integer.parseInt(currentPage);
   		}
   		System.out.println(nowPage);
   		
   		// 현재 페이지 번호를 알면
   		// 현재 페이지에 표시되는 게시글을 시작 번호와 끝 번호를 알 수 있다.
   		// 추가로 페이지 당 게시글 수(recordPerPage)를 알아야 한다.
   		int recordPerPage = 8;
   		int begin = (nowPage - 1) * recordPerPage + 1;
   		int end = begin + recordPerPage - 1;
   		
   		//전체 게시글 개수 구하기 
   		int totalRecord = fDao.totalCountReview();
      
   		// ◀ 1 2 3 ▶ 생성 (pagingView)
		String pagingView = Paging.getPaging("faqSearchResult", nowPage, recordPerPage, totalRecord);
   		
   		
   		String content = "%" + request.getParameter("content") + "%";
   		
   		ArrayList<FaqDto> list = fDao.faqSearchResult(content, begin, end);
   		
   		
   		
   		for( int i = 0, len = list.size(); i < len ; i++ ) {
      	FaqDto fDto = list.get(i);
			if( fDto.getFaq_category().equals("delievery") ){ 
				fDto.setFaq_category("배송");
			} else if ( fDto.getFaq_category().equals("payment") ){
				fDto.setFaq_category("결제/영수증");
			} else if ( fDto.getFaq_category().equals("order") ){
				fDto.setFaq_category("주문");
			} else if ( fDto.getFaq_category().equals("ret") ){
				fDto.setFaq_category("취소/반품");
			} else if ( fDto.getFaq_category().equals("review") ){
				fDto.setFaq_category("리뷰");
			} else if ( fDto.getFaq_category().equals("member") ){
				fDto.setFaq_category("회원");
			} else if ( fDto.getFaq_category().equals("etc") ){
				fDto.setFaq_category("기타");
			}
      }
      model.addAttribute("currentPage", request.getParameter("currentPage"));
      model.addAttribute("pagingView", pagingView);
      model.addAttribute("faqList", list);
      model.addAttribute("faqListCount", list.size());
      model.addAttribute("content", request.getParameter("content"));
	}

}
