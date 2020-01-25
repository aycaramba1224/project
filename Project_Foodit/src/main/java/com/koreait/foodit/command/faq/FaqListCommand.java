package com.koreait.foodit.command.faq;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.FaqDao;

public class FaqListCommand implements FaqCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
        FaqDao fDao = sqlSession.getMapper(FaqDao.class);
        
        model.addAttribute("faqList", fDao.faqList());
        model.addAttribute("faqListCount", fDao.faqList().size());
        
		
		
		
	}

}
