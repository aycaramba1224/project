package com.koreait.foodit.command.review;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.ReviewDao;

public class ReviewSearchCommand implements ReviewCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		ReviewDao rDao = sqlSession.getMapper(ReviewDao.class);
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String query = request.getParameter("query"); 
		String content = "%" + request.getParameter("content") + "%";
		model.addAttribute("reviewList", rDao.reviewQuery(query, content));
		
		
		
	}

}