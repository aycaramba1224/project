package com.koreait.foodit.dao;

import java.util.ArrayList;
import com.koreait.foodit.dto.OrderBaseDto;


public interface OrderBaseDao {

   //회원일떄 배송정보 관련	
	public int memberdeInsert(String delivery_name,String delivery_phone,String delivery_phone2,String delivery_phone3,
			String order_post,String order_road1);
	public OrderBaseDto memberDeliveryList(String delivery_name,int order_no);
	
	/*아직 안됨..
	public int deliveryeInsert(String delivery_name,String delivery_phone,String delivery_phone2,String delivery_phone3,
			String order_post,String order_road1);
	*/
	//비회원 관련
	public OrderBaseDto guestOrder(int order_no,String guest_pw);
	
	public OrderBaseDto guestorderList_view(int order_no);
	
	public ArrayList<OrderBaseDto> findno(String guestquery ,String content);
	
	
	//장바구니 관련
	public ArrayList<OrderBaseDto> ordercartList();
	// 장바구니 합계 금액 
	//public int sumMoney(String id);

	
	
	
	
	//주문정보 입력
	public int orderListModify(String order_name,String order_phone,String order_phone2,String order_phone3,
			String order_email,String order_email2,String delivery_name,String delivery_phone,String delivery_phone2,String delivery_phone3,
			String order_post,String order_road1,int order_no);
	public int orderBaseDelete(int order_no);
	public OrderBaseDto orderList_view(String order_name);
	public ArrayList<OrderBaseDto> orderList();
	public int orderInsert(String guest_pw,String order_name,String order_phone,String order_phone2,String order_phone3,String order_email,String order_email2,
			String delivery_name,String delivery_phone,String delivery_phone2,String delivery_phone3,
			String order_post,String order_road1);
	
	
}
