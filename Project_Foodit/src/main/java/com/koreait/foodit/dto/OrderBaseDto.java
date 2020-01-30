package com.koreait.foodit.dto;

import java.sql.Date;
public class OrderBaseDto {
/*
	order_id      VARCHAR2(20) , 
    id   VARCHAR2(20) ,
   order_name    VARCHAR2(20)    NOT NULL, 
   order_post      VARCHAR2(20)    NOT NULL, 
   order_road1    VARCHAR2(50)    NOT NULL,
   order_road2   VARCHAR2(50)  NOT NULL,
   order_road3   VARCHAR2(50) NULL,
   order_phone    VARCHAR2(20)  NOT NULL, 
   amount     NUMBER NOT NULL ,
   orderDate   Date  default sysdate,
	*/
	
	private String order_id,
			id,
			order_name,
			order_post,
			order_road1,
			order_road2,
			order_road3,
			order_phone;
	private int amount;
	private Date orderDate;
	
	public OrderBaseDto() {}
	public OrderBaseDto(String order_id, String id, String order_name, String order_post, String order_road1,
			String order_road2, String order_road3, String order_phone, int amount, Date orderDate) {
		super();
		this.order_id = order_id;
		this.id = id;
		this.order_name = order_name;
		this.order_post = order_post;
		this.order_road1 = order_road1;
		this.order_road2 = order_road2;
		this.order_road3 = order_road3;
		this.order_phone = order_phone;
		this.amount = amount;
		this.orderDate = orderDate;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getOrder_road1() {
		return order_road1;
	}
	public void setOrder_road1(String order_road1) {
		this.order_road1 = order_road1;
	}
	public String getOrder_road2() {
		return order_road2;
	}
	public void setOrder_road2(String order_road2) {
		this.order_road2 = order_road2;
	}
	public String getOrder_road3() {
		return order_road3;
	}
	public void setOrder_road3(String order_road3) {
		this.order_road3 = order_road3;
	}
	public String getOrder_phone() {
		return order_phone;
	}
	public void setOrder_phone(String order_phone) {
		this.order_phone = order_phone;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	
	
}
