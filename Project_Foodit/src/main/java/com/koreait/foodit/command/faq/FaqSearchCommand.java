package com.koreait.foodit.command.faq;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.FaqDao;

public class FaqSearchCommand implements FaqCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
       FaqDao fDao = sqlSession.getMapper(FaqDao.class); 
       
      Map<String, Object> map = model.asMap();
      
      HttpServletRequest request = (HttpServletRequest)map.get("request");
      
      String query = request.getParameter("query");
      
      String content = "%" + request.getParameter("content") + "%";
		model.addAttribute("faqList", fDao.faqSearchResult(query, content));
		model.addAttribute("faqListCount", fDao.faqSearchResult(query, content).size());
	}

}
