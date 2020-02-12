package com.koreait.foodit.dao;

import java.util.ArrayList;
import com.koreait.foodit.dto.OrderBaseDto;


public interface OrderBaseDao {

   //회원일떄 배송정보 관련	
	public int memberdeInsert(String delivery_name,String delivery_phone,String delivery_phone2,String delivery_phone3,
			String order_post,String order_road1);
	
	//장바구니 정보 불러옴
	public ArrayList<OrderBaseDto> memberordercartList();
	
	//배송정보 관련
	public ArrayList<OrderBaseDto> deliveryList();
	public int deliveryeInsert(String delivery_name,String delivery_phone,String delivery_phone2,String delivery_phone3,
			String order_post,String order_road1);

	//비회원 관련
	
	public OrderBaseDto guestOrderList(int order_no,String guest_pw);
	public int orderInsert(String guest_pw,String order_name,String order_phone,String order_phone2,String order_phone3,String order_email,String order_email2,
			String delivery_name,String delivery_phone,String delivery_phone2,String delivery_phone3,
			String order_post,String order_road1);
	

	//장바구니 관련
	
	public int sumMoney();
	

	
	//주문정보 내역 수정,삭제 등 
	//public int orderListModify(String order_name,String order_phone,String order_phone2,String order_phone3,
			//String order_email,String order_email2,String delivery_name,String delivery_phone,String delivery_phone2,String delivery_phone3,
			//String order_post,String order_road1,int order_no);
	//public int orderBaseDelete(int order_no);
	//public OrderBaseDto orderList_view(String order_name);
	
}
