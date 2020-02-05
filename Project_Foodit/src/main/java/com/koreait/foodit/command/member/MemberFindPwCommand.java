package com.koreait.foodit.command.member;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.foodit.dao.MemberDao;
import com.koreait.foodit.dto.MemberDto;

public class MemberFindPwCommand implements MemberCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		MemberDao mDao = sqlSession.getMapper(MemberDao.class);
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		RedirectAttributes rtts = (RedirectAttributes) map.get("rtts");
		String id = request.getParameter("id");
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
		
		 /** 임의 비밀번호 10자리 생성 **/
	    char pwCollection[] = new char[] {
	                        '1','2','3','4','5','6','7','8','9','0',
	                        'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
	                        'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
	                        '!','@','#','$','%','^','&','*','(',')'};//배열에 선언
	
	    String ranPw = "";
	    for (int i = 0; i < 10; i++) {
	    	int selectRandomPw = (int)(Math.random()*(pwCollection.length));
	    	ranPw += pwCollection[selectRandomPw];
	    }
	    int result = mDao.ranPw(ranPw, id);
	    MemberDto mDto = mDao.findPw(id, birth, phone);
	    
	    if( mDto != null ) {
	    	rtts.addFlashAttribute("mDto", mDto);
	    	if( result > 0 ) {
	    		rtts.addFlashAttribute("userUpdated", "YES");
	    	} else {
	    		rtts.addFlashAttribute("userUpdated", "NO");
	    	}
	    }
	}

}
