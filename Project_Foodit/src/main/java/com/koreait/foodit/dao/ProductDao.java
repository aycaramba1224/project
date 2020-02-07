package com.koreait.foodit.dao;

import java.util.ArrayList;

import com.koreait.foodit.dto.ProductDto;

public interface ProductDao {

	// 기본 CRUD 
	public ArrayList<ProductDto> productList();
	public ProductDto productView(int product_no);	
	public ProductDto productModifyPage(int product_no);	
	public int productModify(String product_name, int product_price, String product_taste, 
							 String product_stock, String product_content, String product_img, String product_thumbImg, int product_no);	
	public int productInsert(String product_name, int product_price, String product_content,
							String product_stock, String product_taste, String product_img, String product_thumbImg);		
	public int productDelete(int product_no);
	
	// 상품 검색 
	public ArrayList<ProductDto> productSearchResult(String query, String content);
	
	// 상품 정렬 리스트  
	public ArrayList<ProductDto> productListOrder1(); // 신메뉴순 정렬 리스트
	public ArrayList<ProductDto> productListOrder2(); // 가격 내림 차순 정렬 리스트 (높은가격 순)
	public ArrayList<ProductDto> productListOrder3(); // 가격 오름 차순 정렬 리스트 (낮은가격 순)
	public ArrayList<ProductDto> productListOrder4(); // 만족도순 정렬 리스트 (임시로 재고순으로 넣음 )
	
	// 페이징 처리 	
	public int productCount(); 
	public ArrayList<ProductDto> productListPage(int begin, int end);
	 
}
