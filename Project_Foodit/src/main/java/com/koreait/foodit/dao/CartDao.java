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
	public ArrayList<CartDto> guestCartList(String cart_id);	
	public int guestCartInsert (String cart_id, int product_no, int cart_amount); 
		// ↓비회원이 상품을 장바구니에 담고 로그인 했을때 비회원에게 부여한 임시 아이디를 본래의 아이디로 업데이트 해준다.
	public void changeId(String newId, String oldId);		
	
	
  //주문하기 페이지 관련 회원일떄
   public ArrayList<CartDto> ordercartList(String cart_id);
   public int  membercartUpdate(String cart_id);

  //주문하기 페이지 비회원일 떄
	public ArrayList<CartDto> guestordercartList(String cart_id);
	public int  guestcartUPdate();
	
}