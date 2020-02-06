package com.koreait.foodit.dao;

import java.util.ArrayList;

import com.koreait.foodit.dto.ReviewDto;

public interface ReviewDao {
	
	
	public ArrayList<ReviewDto> reviewList();
	
	public ReviewDto reviewView(int re_no); 
	
	public int reviewWrite(String re_id, String re_product_name, String re_content, 
			               String re_pw, String re_score, int re_product_no, String re_img, String re_thumbImg);
	
	public int reviewModify(String re_content,
			                String re_pw, String re_score);
	
	public int reviewDelete(int re_no); 
	
	public ArrayList<ReviewDto> reviewQuery(String query, String content);

	
	
}

