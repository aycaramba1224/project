package com.koreait.foodit.dao;

import java.util.ArrayList;

import com.koreait.foodit.dto.ProductDto;

public interface ProductDao {

	public ArrayList<ProductDto> productList();
	
	public ProductDto productView(int product_no);	
	
	public ProductDto productModifyPage(int product_no);	
	
	public int productModify(String product_name, String product_price, String product_taste, 
							 String product_stock, String product_content, int product_no);
	
	public int productInsert(String product_name, String product_price, String product_content,
							String product_stock, String product_taste);	
	
	public int productDelete(int product_no);
	
	public ArrayList<ProductDto> productSearchResult(String query, String content);
	
	// 페이징 처리 
	public int totalRecord();
}
