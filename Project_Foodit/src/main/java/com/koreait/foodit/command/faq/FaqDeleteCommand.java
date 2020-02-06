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
		
		RedirectAttributes attributes = (RedirectAttributes)map.get("attribute");
		attributes.addFlashAttribute("faqDeleteRes", fDao.faqDelete(Integer.parseInt(request.getParameter("faq_no"))));
		attributes.addFlashAttribute("isFaqDelete", "Yes"); 
		
		
	}

}
