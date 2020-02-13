package com.koreait.foodit.command.notice;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.NoticeDao;

public class NoticeModifyPageCommand implements NoticeCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		NoticeDao nDao = sqlSession.getMapper(NoticeDao.class); 
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int notice_no = Integer.parseInt(request.getParameter("notice_no")); 
		
		model.addAttribute("nDto", nDao.noticeView(notice_no));
		
	}

}
