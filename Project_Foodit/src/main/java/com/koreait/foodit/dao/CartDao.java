package com.koreait.foodit.dao;

import java.util.ArrayList;

import com.koreait.foodit.dto.CartDto;

public interface CartDao { 
 	
	public ArrayList<CartDto> cartList();
	
	public int cartInsert (String cart_id, int product_no, int cart_amount);  	 
	
	public int cartDelete(int cart_no);
	
	public int cartUpdate(int cart_amount, int product_no );
	public int cartCount(int product_no);
	public int sumMoney();
}
