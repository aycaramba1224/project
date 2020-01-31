package com.koreait.foodit.dto;

public class OrderDetalistDto {
	/*
	CREATE TABLE order_details
	(
	    orderDetailsNum  NUMBER NOT NULL primary key,  
	    order_id  VARCHAR2(20),
	    buy_pro_no NUMBER, 
	    buy_count VARCHAR2(20)
	);
	*/
	private String order_id,buy_count;
	private int orderDetailsNum,buy_pro_no;
	public OrderDetalistDto() {}
	public OrderDetalistDto(String order_id, String buy_count, int orderDetailsNum, int buy_pro_no) {
		super();
		this.order_id = order_id;
		this.buy_count = buy_count;
		this.orderDetailsNum = orderDetailsNum;
		this.buy_pro_no = buy_pro_no;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getBuy_count() {
		return buy_count;
	}
	public void setBuy_count(String buy_count) {
		this.buy_count = buy_count;
	}
	public int getOrderDetailsNum() {
		return orderDetailsNum;
	}
	public void setOrderDetailsNum(int orderDetailsNum) {
		this.orderDetailsNum = orderDetailsNum;
	}
	public int getBuy_pro_no() {
		return buy_pro_no;
	}
	public void setBuy_pro_no(int buy_pro_no) {
		this.buy_pro_no = buy_pro_no;
	}
	
	
	
	
	
	
	
}
