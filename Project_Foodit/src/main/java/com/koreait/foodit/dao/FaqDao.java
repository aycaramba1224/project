package com.koreait.foodit.dao;

import java.util.ArrayList;

import com.koreait.foodit.dto.FaqDto;

public interface FaqDao {
   public ArrayList<FaqDto>faqList();
   public FaqDto faqView(int faq_no);
   public int faqModify(String faq_title, String faq_content, String faq_category, int faq_no);
   public int faqWrite(String faq_title, String faq_content,  String faq_category);
   public int faqDelete(int faq_no);
   // FAQ 검색
   public ArrayList<FaqDto> faqSearchResult(String query, String content);
   
   // FAQ 카테고리 정렬 
   public ArrayList<FaqDto> faqSelect(String faq_category); 
}
