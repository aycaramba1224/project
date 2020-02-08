package com.koreait.foodit.dto;

public class CartDto {
	
	private int cart_no, 				// 장바구니 번호 (SEQ, PK)
				product_no, 			// 상품 번호
				product_price, 			// 상품 금액
				cart_amount;			// 장바구니에 담긴 수량
    private String cart_id, 			// 장바구니 이용고객의 ID
				   product_name, 		// 상품명
				   product_thumbImg; 	// 상품 썸네일
    
	public CartDto() { }
	public CartDto(int cart_no, int product_no, int product_price, int cart_amount, String cart_id, String product_name,
			String product_thumbImg) {
		super();
		this.cart_no = cart_no;
		this.product_no = product_no;
		this.product_price = product_price;
		this.cart_amount = cart_amount;
		this.cart_id = cart_id;
		this.product_name = product_name;
		this.product_thumbImg = product_thumbImg;
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
