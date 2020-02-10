package com.koreait.foodit.command.faq;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.FaqDao;
import com.koreait.foodit.dto.FaqDto;

public class FaqSearchCommand implements FaqCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
      FaqDao fDao = sqlSession.getMapper(FaqDao.class); 
       
      Map<String, Object> map = model.asMap();
      HttpServletRequest request = (HttpServletRequest)map.get("request");
      
      String content = "%" + request.getParameter("content") + "%";
      ArrayList<FaqDto> list = fDao.faqSearchResult(content);
      for( int i = 0, len = list.size(); i < len ; i++ ) {
      	FaqDto fDto = list.get(i);
			if( fDto.getFaq_category().equals("delievery") ){ 
				fDto.setFaq_category("배송");
			} else if ( fDto.getFaq_category().equals("payment") ){
				fDto.setFaq_category("결제/영수증");
			} else if ( fDto.getFaq_category().equals("order") ){
				fDto.setFaq_category("주문");
			} else if ( fDto.getFaq_category().equals("ret") ){
				fDto.setFaq_category("취소/반품");
			} else if ( fDto.getFaq_category().equals("review") ){
				fDto.setFaq_category("리뷰");
			} else if ( fDto.getFaq_category().equals("member") ){
				fDto.setFaq_category("회원");
			} else if ( fDto.getFaq_category().equals("etc") ){
				fDto.setFaq_category("기타");
			}
      }
      model.addAttribute("faqList", list);
      model.addAttribute("faqListCount", list.size());
      model.addAttribute("content", request.getParameter("content"));
	}

}
