package com.koreait.foodit.dao;

import java.util.ArrayList;

import com.koreait.foodit.dto.OrderBaseDto;

public interface OrderBaseDao {

	public int orderInsert(int order_no,String order_name,String order_post,String order_road);
	public ArrayList<OrderBaseDto> orderList();
}
