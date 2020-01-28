package com.koreait.foodit.dao;

import java.util.ArrayList;

import com.koreait.foodit.dto.ProductDto;

public interface ProductDao {

	public ArrayList<ProductDto> productList();
	public ProductDto productView(int pro_no);	
	public int productModify(String pro_name, String pro_price, String pro_content, String pro_stock,
						 	String pro_taste, int pro_no);
	public int productInsert(int pro_no, String pro_name, String pro_price, String pro_content,
							String pro_stock, String pro_taste );	
	public int productDelete(int pro_no);
	
	public ArrayList<ProductDto> productSearchResult(String query, String content);
	
}
