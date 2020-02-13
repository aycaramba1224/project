package com.koreait.foodit.dao;

import java.util.ArrayList;

import com.koreait.foodit.dto.ReviewDto;

public interface ReviewDao {
	
	
	public ArrayList<ReviewDto> reviewList(int begin, int end);
	public int totalCountReview();
	
	public ArrayList<ReviewDto> reviewSearchResult(String content, int begin, int end);
	public int reviewSearchTotalCount(String content); 
	
	public ArrayList<ReviewDto> myReview(String re_id, int begin, int end);
	public int myReviewTotalCount(String re_id); 
	
	
	public ReviewDto reviewView(int re_no); 
	
	public int reviewWrite(String re_id, String re_product_name, String re_content, 
			               String re_pw, String re_score, int re_product_no, String re_img);
	
	public ReviewDto reviewWritePage(String re_product_name);
	
	
	
	public ReviewDto reviewModify(String re_content,
			                String re_pw, String re_score, String re_img, int re_no);
	
	public int reviewDelete(int re_no); 
	

	
	
}

