package com.koreait.foodit.dao;

import java.util.ArrayList;
import com.koreait.foodit.dto.OrderBaseDto;

public interface OrderBaseDao {

	public int orderInsert(int order_no,String order_id,String order_name,String order_post,String order_road);
	public ArrayList<OrderBaseDto> orderList();
	public OrderBaseDto orderList_view(int order_no);
	public int orderListModify(String order_name,String order_post,String order_road,int order_no);
	public int orderBaseDelete(int order_no);

}
