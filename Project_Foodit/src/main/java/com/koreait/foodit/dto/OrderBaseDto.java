package com.koreait.foodit.dto;

public class OrderBaseDto {

	private int order_no;
	private String 	order_id,
					order_name,
					order_post,
					order_road;
	
	public OrderBaseDto() {	}
	public OrderBaseDto(int order_no, String order_id, String order_name, String order_post, String order_road) {
		super();
		this.order_no = order_no;
		this.order_id = order_id;
		this.order_name = order_name;
		this.order_post = order_post;
		this.order_road = order_road;
	}
	
	
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public String getOrder_post() {
		return order_post;
	}
	public void setOrder_post(String order_post) {
		this.order_post = order_post;
	}
	public String getOrder_road() {
		return order_road;
	}
	public void setOrder_road(String order_road) {
		this.order_road = order_road;
	}
	
}
