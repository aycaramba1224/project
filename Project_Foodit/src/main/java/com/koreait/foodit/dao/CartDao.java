package com.koreait.foodit.dao;

import java.util.ArrayList;

import com.koreait.foodit.dto.CartDto;

public interface CartDao { 
 	
	public ArrayList<CartDto> cartList(String cart_id);
	public ArrayList<CartDto> guestCartList();
	
	public int cartInsert (String cart_id, int product_no, int cart_amount);  	 
	public int GuestCartInsert (int product_no, int cart_amount);  	 
	
	public int cartDelete(int cart_no);
	
	public int cartUpdate(int product_no, int cart_amount );
	public int cartCount(int product_no);
	public int sumMoney(String cart_id);

	 
}
