package com.koreait.foodit.command.review;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.foodit.dao.ReviewDao;

public class ReviewDeleteCommand implements ReviewCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		ReviewDao rDao = sqlSession.getMapper(ReviewDao.class); 
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int re_no = Integer.parseInt(request.getParameter("re_no"));
		
		
		RedirectAttributes redirectAttributes = (RedirectAttributes)map.get("redirectAttributes");
		redirectAttributes.addFlashAttribute("ReviewDeleteRes", rDao.reviewDelete(re_no));
		redirectAttributes.addFlashAttribute("isReviewDelete", "Yes");
		
	}
}