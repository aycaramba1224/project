package com.koreait.foodit.dao;

import java.util.ArrayList;
import com.koreait.foodit.dto.OrderBaseDto;


public interface OrderBaseDao {

	public int orderInsert(String order_name,String order_post,String order_road1);
	public ArrayList<OrderBaseDto> orderList();
	public OrderBaseDto orderList_view(String order_name);
	public int orderListModify(String order_post,String order_road1,String order_name);
	public int orderBaseDelete(String order_name);
	
	
	

}
