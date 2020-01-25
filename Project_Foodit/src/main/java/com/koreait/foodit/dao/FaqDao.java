package com.koreait.foodit.dao;

import java.util.ArrayList;

import com.koreait.foodit.dto.FaqDto;


public interface FaqDao {
	public ArrayList<FaqDto> faqList();
/*	public FaqDto view(int faq_no);
	public int modify(String faq_title, String faq_content, String classno, int faq_no);
	public int write(String faq_title, String faq_content, String faq_id, String classno);
	public int delete(int faq_no);
	public ArrayList<FaqDto> dynamicQueryList(String query, String content);*/
}
