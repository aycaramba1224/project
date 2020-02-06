package com.koreait.foodit.command.notice;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.NoticeDao;

public class NoticeListCommand implements NoticeCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
      NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
      
      model.addAttribute("noticeList", noticeDao.noticeList());
      model.addAttribute("noticeListCount", noticeDao.noticeList().size());
      
      
		
		
		
	}

}
