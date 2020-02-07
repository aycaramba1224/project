package com.koreait.foodit.dto;

import java.sql.Date;
public class OrderBaseDto {

/*
    CREATE TABLE order_base
(
    order_no NUMBER NOT NULL, 
    guest_pw VARCHAR2(20) NOT NULL,
     id   VARCHAR2(20) ,
    order_name    VARCHAR2(10) NOT NULL, 
    order_phone   VARCHAR2(10) ,
    order_phone2   VARCHAR2(10) ,
    order_phone3   VARCHAR2(10) ,
    order_email      VARCHAR2(20) , 
    order_email2      VARCHAR2(20) ,
    delivery_name     VARCHAR2(20),
    delivery_phone   VARCHAR2(20) ,
    delivery_phone2   VARCHAR2(20) ,
    delivery_phone3   VARCHAR2(20) ,
    order_post      VARCHAR2(20)NOT NULL, 
    order_road1    VARCHAR2(50) NOT NULL,
    orderDate   Date default sysdate,
   primary key (order_no)
);
PRODUCT_NAME 
PRODUCT_PRICE
PRODUCT_THUMBIMG
CART_ID
CART_NO 
CART_AMOUNT
PRODUCT_NO

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
			delivery_name,
		    delivery_phone,
		    delivery_phone2,
		    delivery_phone3,
			order_post,
			order_road1,
			product_price,
			product_thumbimg,
			cart_id,product_name;
	private int order_no,product_no;
	private Date orderDate;
    private int cart_no,cart_amount;

	public OrderBaseDto() {}

	public OrderBaseDto(String guest_pw, String id, String order_name, String order_phone, String order_phone2,
			String order_phone3, String order_email, String order_email2, String delivery_name, String delivery_phone,
			String delivery_phone2, String delivery_phone3, String order_post, String order_road1, String product_price,
			String product_thumbimg, String cart_id, String product_name, int order_no, int product_no, Date orderDate,
			int cart_no, int cart_amount) {
		super();
		this.guest_pw = guest_pw;
		this.id = id;
		this.order_name = order_name;
		this.order_phone = order_phone;
		this.order_phone2 = order_phone2;
		this.order_phone3 = order_phone3;
		this.order_email = order_email;
		this.order_email2 = order_email2;
		this.delivery_name = delivery_name;
		this.delivery_phone = delivery_phone;
		this.delivery_phone2 = delivery_phone2;
		this.delivery_phone3 = delivery_phone3;
		this.order_post = order_post;
		this.order_road1 = order_road1;
		this.product_price = product_price;
		this.product_thumbimg = product_thumbimg;
		this.cart_id = cart_id;
		this.product_name = product_name;
		this.order_no = order_no;
		this.product_no = product_no;
		this.orderDate = orderDate;
		this.cart_no = cart_no;
		this.cart_amount = cart_amount;
	}

    
	public String getProduct_price() {
		return product_price;
	}

	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}

	public String getProduct_thumbimg() {
		return product_thumbimg;
	}

	public void setProduct_thumbimg(String product_thumbimg) {
		this.product_thumbimg = product_thumbimg;
	}

	public String getCart_id() {
		return cart_id;
	}

	public void setCart_id(String cart_id) {
		this.cart_id = cart_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public int getCart_amount() {
		return cart_amount;
	}

	public void setCart_amount(int cart_amount) {
		this.cart_amount = cart_amount;
	}

	public int getCart_no() {
		return cart_no;
	}

	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}

	public String getDelivery_name() {
		return delivery_name;
	}

	public void setDelivery_name(String delivery_name) {
		this.delivery_name = delivery_name;
	}

	public String getDelivery_phone() {
		return delivery_phone;
	}

	public void setDelivery_phone(String delivery_phone) {
		this.delivery_phone = delivery_phone;
	}

	public String getDelivery_phone2() {
		return delivery_phone2;
	}

	public void setDelivery_phone2(String delivery_phone2) {
		this.delivery_phone2 = delivery_phone2;
	}

	public String getDelivery_phone3() {
		return delivery_phone3;
	}

	public void setDelivery_phone3(String delivery_phone3) {
		this.delivery_phone3 = delivery_phone3;
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

	

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	
	
}
