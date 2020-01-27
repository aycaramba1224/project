package com.koreait.foodit.dao;

import java.util.ArrayList;

import com.koreait.foodit.dto.ProductDto;

public interface CartDao {

	public ArrayList<ProductDto> cartList();
	
	
	public ProductDto cartView(int pro_no);
	
	public int cartInsert (int cart_no, String id, int pro_no, int cart_amount);
	
}
