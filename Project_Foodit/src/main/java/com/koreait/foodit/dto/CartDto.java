package com.koreait.foodit.dto;

public class CartDto {
	
	private int cart_no, 
				product_no, 
				product_price, 
				cart_amount,
				guest_no;
    private String cart_id, 
				   product_name, 
				   product_thumbImg; 
    private int order_no;
	public CartDto() { }
	public CartDto(int order_no,int guest_no,int cart_no, int product_no, int product_price, int cart_amount, String cart_id, String product_name,
			String product_thumbImg) {
		super();
		this.order_no = order_no;
		this.guest_no = guest_no;
		this.cart_no = cart_no;
		this.product_no = product_no;
		this.product_price = product_price;
		this.cart_amount = cart_amount;
		this.cart_id = cart_id;
		this.product_name = product_name;
		this.product_thumbImg = product_thumbImg;
	}
    
	
	public int getGuest_no() {
		return guest_no;
	}
	public void setGuest_no(int guest_no) {
		this.guest_no = guest_no;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getCart_amount() {
		return cart_amount;
	}
	public void setCart_amount(int cart_amount) {
		this.cart_amount = cart_amount;
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
	public String getProduct_thumbImg() {
		return product_thumbImg;
	}
	public void setProduct_thumbImg(String product_thumbImg) {
		this.product_thumbImg = product_thumbImg;
	}
	
		
}
