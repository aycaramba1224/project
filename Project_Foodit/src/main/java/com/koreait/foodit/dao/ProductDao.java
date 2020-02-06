package com.koreait.foodit.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.koreait.foodit.dto.ProductDto;

public interface ProductDao {

	public ArrayList<ProductDto> productList();

	public ProductDto productView(int product_no);	
	
	public ProductDto productModifyPage(int product_no);	
	
	public int productModify(String product_name, String product_price, String product_taste, 
							 String product_stock, String product_content, int product_no);
	
	public int productInsert(String product_name, String product_price, String product_content,
							String product_stock, String product_taste, String product_img, String product_thumbImg);	
	
	public int productDelete(int product_no);
	
	public ArrayList<ProductDto> productSearchResult(String query, String content);
	
	public int productCount(); // 게시물의 총 개수 
	
	public ArrayList<ProductDto> productListPage(int begin, int end);
	 
}
