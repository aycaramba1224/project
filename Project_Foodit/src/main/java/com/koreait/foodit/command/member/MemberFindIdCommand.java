package com.koreait.foodit.command.member;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.foodit.dao.MemberDao;

public class MemberFindIdCommand implements MemberCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		MemberDao mDao = sqlSession.getMapper(MemberDao.class);
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		RedirectAttributes rtts = (RedirectAttributes) map.get("rtts");
		String name = request.getParameter("name");
		String inBirth = request.getParameter("birth");
		String inPhone = request.getParameter("phone");
		
		// 생년월일 DB format에 맞게 파싱
		String bYear = inBirth.substring(0,2);
		String bMonth = inBirth.substring(2,4);
		String bDay = inBirth.substring(4,6);
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yy");
		String toYear = sdf.format(today);
		String year = Integer.parseInt(bYear) > Integer.parseInt(toYear) ? "19" + bYear : "20" + bYear;
		String birth = year + "-" + bMonth + "-" + bDay;
		
		// 휴대폰번호 DB format에 맞게 파싱
		String midNum, lastNum;
		if( inPhone.length() < 7 ) {
			midNum = inPhone.substring(0,5);
			lastNum = inPhone.substring(5);
		} else {
			midNum = inPhone.substring(0,4);
			lastNum = inPhone.substring(4);
		}
		String phone = midNum + "-" + lastNum;
		
		rtts.addFlashAttribute("mDto", mDao.findId(name, birth, phone));
		
		
	}

}
