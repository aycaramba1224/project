package com.koreait.foodit.dto;

import java.sql.Date;
public class OrderBaseDto {

/*
CREATE TABLE order_base
(
   CREATE TABLE order_base
(
    order_no      NUMBER NOT NULL, 
     id   VARCHAR2(20) ,
    order_name    VARCHAR2(20)    NOT NULL, 
    order_phone   VARCHAR2(20) ,
    order_phone2   VARCHAR2(20) ,
    order_phone3   VARCHAR2(20) ,
    order_email      VARCHAR2(20) , 
    order_email2      VARCHAR2(20) , 
    order_post      VARCHAR2(20)    NOT NULL, 
    order_road1    VARCHAR2(50)    NOT NULL,
    amount     NUMBER  ,
   orderDate   Date  default sysdate,
   primary key (order_no)
);
CREATE SEQUENCE ORDER_BASE_SEQ
START WITH 40
INCREMENT BY 2;
	*/
	private String
	        guest_pw,
			id,
			order_name,
			order_phone,
			order_phone2,
			order_phone3,
			order_email,
			order_email2,
			order_post,
			order_road1;
	private int amount,order_no;
	private Date orderDate;

	public OrderBaseDto() {}

	public OrderBaseDto(int order_no,String guest_pw, String id, String order_name, String order_phone,String order_phone2,String order_phone3 ,String order_email,
		String order_email2,String order_post, String order_road1, int amount, Date orderDate) {
		super();
		this.order_no = order_no;
		this.guest_pw = guest_pw;
		this.id = id;
		this.order_name = order_name;
		this.order_phone = order_phone;
		this.order_phone2 = order_phone2;
		this.order_phone3 = order_phone3;
		this.order_email = order_email;
		this.order_email2 = order_email2;
		this.order_post = order_post;
		this.order_road1 = order_road1;
		this.amount = amount;
		this.orderDate = orderDate;
	}

	public String getOrder_phone2() {
		return order_phone2;
	}

	public void setOrder_phone2(String order_phone2) {
		this.order_phone2 = order_phone2;
	}

	public String getOrder_phone3() {
		return order_phone3;
	}

	public void setOrder_phone3(String order_phone3) {
		this.order_phone3 = order_phone3;
	}

	public String getOrder_email2() {
		return order_email2;
	}

	public void setOrder_email2(String order_email2) {
		this.order_email2 = order_email2;
	}

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}

	public String getGuest_pw() {
		return guest_pw;
	}

	public void setGuest_pw(String guest_pw) {
		this.guest_pw = guest_pw;
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
