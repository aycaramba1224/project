package com.koreait.foodit.command.faq;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.foodit.dao.FaqDao;

public class FaqWriteCommand implements FaqCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
       FaqDao fDao = sqlSession.getMapper(FaqDao.class); 
       
       Map<String, Object> map = model.asMap();
       
       HttpServletRequest request = (HttpServletRequest) map.get("request"); 
       String faq_title = request.getParameter("faq_title"); 
       String faq_content= request.getParameter("faq_content");
       String faq_category = request.getParameter("faq_category");
	
       RedirectAttributes attributes = (RedirectAttributes) map.get("attributes");
       attributes.addFlashAttribute("faqWriteRes", fDao.faqWrite(faq_title, faq_content, faq_category ));
       attributes.addFlashAttribute("isFaqWrite", "Yes"); 
       
       
	}

}
