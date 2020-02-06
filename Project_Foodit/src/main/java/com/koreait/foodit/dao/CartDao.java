package com.koreait.foodit.dao;

import java.util.ArrayList;

import com.koreait.foodit.dto.CartDto;

public interface CartDao { 
 	
	// 기본 CRUD
	public ArrayList<CartDto> cartList(String cart_id);	
	public int cartInsert (String cart_id, int product_no, int cart_amount); 
	public int cartDelete(int cart_no);		
	public int cartUpdate(int product_no, int cart_amount );	
		
	// 장바구니 수량 
	public int cartCount(int product_no);
	
	// 장바구니 합계 금액 
	public int sumMoney(String cart_id);
		
	// 비회원 장바구니 
	public ArrayList<CartDto> guestCartList();
	public int guestCartInsert (String cart_id, int product_no, int cart_amount); 
	public int guestSumMoney();
	
}
