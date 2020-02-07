package com.koreait.foodit.command.faq;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.FaqDao;

public class FaqSelectCommand implements FaqCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
       FaqDao fDao = sqlSession.getMapper(FaqDao.class);
       
       Map<String, Object> map = model.asMap();
       
       HttpServletRequest request = (HttpServletRequest)map.get("request");
       
       String faq_category = request.getParameter("faq_category"); 
      
      model.addAttribute("faqList", fDao.faqSelect(faq_category));
      model.addAttribute("faqListCount", fDao.faqSelect(faq_category).size());
      model.addAttribute("faq_category", faq_category);
	}

}
