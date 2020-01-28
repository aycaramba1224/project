package com.koreait.foodit.command.faq;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.FaqDao;

public class FaqViewCommand implements FaqCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		FaqDao fDao = sqlSession.getMapper(FaqDao.class); 
		
		Map<String, Object> map = model.asMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		model.addAttribute("fDto", fDao.view(Integer.parseInt(request.getParameter("faq_no"))));
		
		
		
	}

}
