package com.koreait.foodit.command.review;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.foodit.dao.ReviewDao;

public class ReviewModifyCommand implements ReviewCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		ReviewDao rDao = sqlSession.getMapper(ReviewDao.class);
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String re_content = request.getParameter("re_content");
		String re_pw = request.getParameter("re_pw");
		String re_score = request.getParameter("re_score");
		
		RedirectAttributes redirectAttributes = (RedirectAttributes)map.get("redirectAttributes");
		redirectAttributes.addFlashAttribute("isModifyResult", rDao.reviewModify(re_content, re_pw, re_score));
		redirectAttributes.addFlashAttribute("isReviewModify", "YES");
	}

}