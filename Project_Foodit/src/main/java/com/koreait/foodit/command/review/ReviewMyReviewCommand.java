package com.koreait.foodit.command.review;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.ReviewDao;
import com.koreait.foodit.dto.MemberDto;
import com.koreait.foodit.paging.Paging2;

public class ReviewMyReviewCommand implements ReviewCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
        ReviewDao rDao = sqlSession.getMapper(ReviewDao.class);
        
        Map<String, Object> map = model.asMap();
        HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
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
        
   		// ◀ 1 2 3 ▶ 생성 (pagingView)
   		MemberDto mDto = (MemberDto)session.getAttribute("mDto"); 
   		String re_id =  mDto.getId();
		int totalRecord = rDao.myReviewTotalCount(re_id);
		String pagingView = Paging2.getPaging("myReview?re_id=" + re_id, nowPage, recordPerPage, totalRecord);
		
		model.addAttribute("myReview", rDao.myReview(re_id, begin, end));
		model.addAttribute("myReviewSize", rDao.myReview(re_id, begin, end).size());
		model.addAttribute("myReviewTotalCount", rDao.myReviewTotalCount(re_id));
		model.addAttribute("currentPage", currentPage); 
		model.addAttribute("pagingView", pagingView); 
		model.addAttribute("re_id",re_id);
		
	}

}
