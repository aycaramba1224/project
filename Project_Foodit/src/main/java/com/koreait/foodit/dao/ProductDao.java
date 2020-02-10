package com.koreait.foodit.dao;

import java.util.ArrayList;

import com.koreait.foodit.dto.ProductDto;

public interface ProductDao {

	// 기본 CRUD 
	public ArrayList<ProductDto> productList(int begin, int end);
	public ProductDto productView(int product_no);	
	public ProductDto productModifyPage(int product_no);	
	public int productModify(String product_name, int product_price, String product_taste, 
							 String product_stock, String product_content, String product_img, String product_thumbImg, int product_no);	
	public int productInsert(String product_name, int product_price, String product_content,
							String product_stock, String product_taste, String product_img, String product_thumbImg);		
	public int productDelete(int product_no);
	
	// 상품 검색 
	public ArrayList<ProductDto> productSearchResult(String content, int begin, int end);
	
	// 상품 정렬 리스트  
	public ArrayList<ProductDto> productListOrder1(int begin, int end); // 신메뉴순 정렬 리스트
	public ArrayList<ProductDto> productListOrder2(int begin, int end); // 가격 내림 차순 정렬 리스트 (높은가격 순)
	public ArrayList<ProductDto> productListOrder3(int begin, int end); // 가격 오름 차순 정렬 리스트 (낮은가격 순)
	public ArrayList<ProductDto> productListOrder4(int begin, int end); // 만족도순 정렬 리스트 (임시로 재고순으로 넣음 )
	
	// 페이징 처리 	
	public int totalCountProduct();
	
	// 메인페이지 (실시간 베스트)
	public ArrayList<ProductDto> mainList();
	 
}
