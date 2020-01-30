package com.koreait.foodit.dto;

import java.sql.Date;
public class OrderBaseDto {
/*
	CREATE TABLE order_base
(
    order_id      VARCHAR2(20) , 
     id   VARCHAR2(20) ,
    order_name    VARCHAR2(20) NOT NULL,  
    order_phone   VARCHAR2(20) , 
    order_email      VARCHAR2(20) ,  
    order_post      VARCHAR2(20)    NOT NULL, 
    order_road1    VARCHAR2(50)    NOT NULL,
    amount     NUMBER  ,
    orderDate   Date  default sysdate,
   primary key (order_id)
);
	*/
	private String order_id,
			id,
			order_name,
			order_phone,
			order_email,
			order_post,
			order_road1;
	private int amount;
	private Date orderDate;
	
	public OrderBaseDto() {}

	public OrderBaseDto(String order_id, String id, String order_name, String order_phone, String order_email,
			String order_post, String order_road1, int amount, Date orderDate) {
		super();
		this.order_id = order_id;
		this.id = id;
		this.order_name = order_name;
		this.order_phone = order_phone;
		this.order_email = order_email;
		this.order_post = order_post;
		this.order_road1 = order_road1;
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

	public String getOrder_phone() {
		return order_phone;
	}

	public void setOrder_phone(String order_phone) {
		this.order_phone = order_phone;
	}

	public String getOrder_email() {
		return order_email;
	}

	public void setOrder_email(String order_email) {
		this.order_email = order_email;
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
