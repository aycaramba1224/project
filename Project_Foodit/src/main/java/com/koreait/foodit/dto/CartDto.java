package com.koreait.foodit.dto;

public class CartDto {
	
	private int cart_no, pro_no, cart_amount;
	private String id;
	
	public CartDto() { }
	public CartDto(int cart_no, int pro_no, int cart_amount, String id) {
		super();
		this.cart_no = cart_no;
		this.pro_no = pro_no;
		this.cart_amount = cart_amount;
		this.id = id;
	}
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
	public int getPro_no() {
		return pro_no;
	}
	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}
	public int getCart_amount() {
		return cart_amount;
	}
	public void setCart_amount(int cart_amount) {
		this.cart_amount = cart_amount;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
