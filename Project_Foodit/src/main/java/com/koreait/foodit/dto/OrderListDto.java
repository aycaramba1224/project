package com.koreait.foodit.dto;

public class OrderListDto {

	private int order_list_no;
	private String 	order_list_date,
					order_list_current,
					order_list_price;
	
	public OrderListDto() {	}
	public OrderListDto(int order_list_no, String order_list_date, String order_list_current, String order_list_price) {
		super();
		this.order_list_no = order_list_no;
		this.order_list_date = order_list_date;
		this.order_list_current = order_list_current;
		this.order_list_price = order_list_price;
	}
	
	
	public int getOrder_list_no() {
		return order_list_no;
	}
	public void setOrder_list_no(int order_list_no) {
		this.order_list_no = order_list_no;
	}
	public String getOrder_list_date() {
		return order_list_date;
	}
	public void setOrder_list_date(String order_list_date) {
		this.order_list_date = order_list_date;
	}
	public String getOrder_list_current() {
		return order_list_current;
	}
	public void setOrder_list_current(String order_list_current) {
		this.order_list_current = order_list_current;
	}
	public String getOrder_list_price() {
		return order_list_price;
	}
	public void setOrder_list_price(String order_list_price) {
		this.order_list_price = order_list_price;
	}
	
}
