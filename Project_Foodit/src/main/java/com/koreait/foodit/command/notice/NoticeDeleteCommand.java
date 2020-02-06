package com.koreait.foodit.command.notice;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.foodit.dao.NoticeDao;

public class NoticeDeleteCommand implements NoticeCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		NoticeDao  nDao = sqlSession.getMapper(NoticeDao.class); 
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");

		int notice_no = Integer.parseInt(request.getParameter("notice_no"));
		
		
		
		RedirectAttributes attributes = (RedirectAttributes)map.get("attributes");
		attributes.addFlashAttribute("NoticeDeleteRes", nDao.noticeDelete(notice_no));
		attributes.addFlashAttribute("isNoticeDelete", "Yes"); 
		
	}

}
