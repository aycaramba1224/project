package com.koreait.foodit.command.faq;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.foodit.dao.FaqDao;

public class FaqModifyCommand implements FaqCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
      
		FaqDao fDao = sqlSession.getMapper(FaqDao.class);
		
		Map<String, Object> map = model.asMap();
		
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String faq_title = request.getParameter("faq_title"); 
		String faq_content = request.getParameter("faq_content"); 
		String classno = request.getParameter("classno"); 
		int faq_no = Integer.parseInt(request.getParameter("faq_no"));
		
		RedirectAttributes attributes = (RedirectAttributes) map.get("attributes");
		attributes.addFlashAttribute("faqModifyRes", fDao.modify(faq_title, faq_content, classno, faq_no));
		attributes.addFlashAttribute("isFaqModify", "yes");
		
		
	}

}