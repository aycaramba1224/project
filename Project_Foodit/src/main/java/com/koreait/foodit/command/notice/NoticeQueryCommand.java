package com.koreait.foodit.command.notice;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.NoticeDao;

public class NoticeQueryCommand implements NoticeCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		 NoticeDao nDao = sqlSession.getMapper(NoticeDao.class); 
	       
	      Map<String, Object> map = model.asMap();
	      
	      HttpServletRequest request = (HttpServletRequest)map.get("request");
	      
	      String query = request.getParameter("query");
	      
	      String content = "%" + request.getParameter("content") + "%";
			model.addAttribute("noticeList", nDao.noticeQuery(query, content));
			model.addAttribute("noticeListCount", nDao.noticeQuery(query, content).size());

	}

}
