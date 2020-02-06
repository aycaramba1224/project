package com.koreait.foodit.command.review;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.ReviewDao;

public class ReviewListCommand implements ReviewCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		ReviewDao rDao = sqlSession.getMapper(ReviewDao.class); 
		
		model.addAttribute("reviewList", rDao.reviewList());
		model.addAttribute("reviewListCount", rDao.reviewList().size());
		
	}

}