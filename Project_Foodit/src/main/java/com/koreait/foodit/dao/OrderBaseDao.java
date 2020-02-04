package com.koreait.foodit.dao;

import java.util.ArrayList;

import com.koreait.foodit.dto.OrderBaseDto;


public interface OrderBaseDao {

   //회원일떄 배송정보 관련	
	public int memberdeInsert(String delivery_name,String delivery_phone,String delivery_phone2,String delivery_phone3,
			String order_post,String order_road1);
	public ArrayList<OrderBaseDto> memberDeliveryList();
	
	/*아직 안됨..
	public int deliveryeInsert(String delivery_name,String delivery_phone,String delivery_phone2,String delivery_phone3,
			String order_post,String order_road1);
	*/
	//비회원 관련
	public ArrayList<OrderBaseDto> guestOrder(String guestquery ,String content);
	public ArrayList<OrderBaseDto> guest_noOrder(String guestquery2 ,String content2);
	public OrderBaseDto guestorderList_view(int order_no);
	
	
	
	
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
