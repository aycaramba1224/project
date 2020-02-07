package com.koreait.foodit.command.faq;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.foodit.dao.FaqDao;

public class FaqDeleteCommand implements FaqCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		FaqDao fDao = sqlSession.getMapper(FaqDao.class); 
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int faq_no = Integer.parseInt(request.getParameter("faq_no"));
		
		RedirectAttributes attributes = (RedirectAttributes)map.get("attributes");
		attributes.addFlashAttribute("faqDeleteRes", fDao.faqDelete(faq_no));
		attributes.addFlashAttribute("isFaqDelete", "Yes"); 
		
		
	}

}
