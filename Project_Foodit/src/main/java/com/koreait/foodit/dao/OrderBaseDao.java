package com.koreait.foodit.dao;

import java.util.ArrayList;
import com.koreait.foodit.dto.OrderBaseDto;

public interface OrderBaseDao {

	public int orderInsert(String order_id,String order_name,String order_post,String order_road1,String order_road2,String order_road3,String order_phone);
	public ArrayList<OrderBaseDto> orderList();
	public OrderBaseDto orderList_view(String order_id);
	public int orderListModify(String order_name,String order_post,String order_road1,String order_road2,String order_road3,String order_phone,String order_id);
	public int orderBaseDelete(String order_id);

}
