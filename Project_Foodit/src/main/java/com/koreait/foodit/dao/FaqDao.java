package com.koreait.foodit.dao;

import java.util.ArrayList;

import com.koreait.foodit.dto.FaqDto;

public interface FaqDao {
   
   public ArrayList<FaqDto>faqList(int begin, int end);
   // FAQ 카테고리 정렬 
   public ArrayList<FaqDto> faqSelect(String faq_category, int begin, int end); 
   public int totalCountReview();
   public int selectTotalCount(String faq_content);
   public ArrayList<FaqDto> faqSearchResult(String content, int begin, int end);
   
   
   
   public FaqDto faqView(int faq_no);
   public int faqModify(String faq_title, String faq_content, String faq_category, int faq_no);
   public int faqWrite(String faq_title, String faq_content,  String faq_category);
   public int faqDelete(int faq_no);
   // FAQ 검색
}
