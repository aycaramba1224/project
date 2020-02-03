package com.koreait.foodit.dao;

import java.util.ArrayList;
import com.koreait.foodit.dto.OrderBaseDto;


public interface OrderBaseDao {

	public int orderInsert(String guest_pw,String order_name,String order_phone,
			String order_phone2,String order_phone3,String order_email,String order_email2,
			String delivery_name,String delivery_phone,String delivery_phone2,String delivery_phone3,
			String order_post,String order_road1);
	public ArrayList<OrderBaseDto> orderList();
	public OrderBaseDto orderList_view(int order_no);
	public int orderListModify(String order_name,String order_phone,String order_phone2,String order_phone3,
			String order_email,String order_email2,String delivery_name,String delivery_phone,String delivery_phone2,String delivery_phone3,
			String order_post,String order_road1,int order_no);
	public int orderBaseDelete(int order_no);
	
	public ArrayList<OrderBaseDto> guestOrder(String guestquery ,String content);
	public ArrayList<OrderBaseDto> guest_noOrder(String guestquery2 ,String content2);
	public OrderBaseDto guestorderList_view(int order_no);
	
	
	
	
}
