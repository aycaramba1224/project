package com.koreait.foodit.dto;

public class CartDto {
	
	private int cart_no;
    private String cart_id;
    private String name;
    private int product_no;
    private String product_name;
    private int product_price;
    private int money;
    private int cart_amount;  
	
	public CartDto() { }

	public CartDto(int cart_no, String cart_id, String name, int product_no, String product_name, int product_price,
			int money, int cart_amount) {
		super();
		this.cart_no = cart_no;
		this.cart_id = cart_id;
		this.name = name;
		this.product_no = product_no;
		this.product_name = product_name;
		this.product_price = product_price;
		this.money = money;
		this.cart_amount = cart_amount;
	}

	public int getCart_no() {
		return cart_no;
	}

	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}

	public String getCart_id() {
		return cart_id;
	}

	public void setCart_id(String cart_id) {
		this.cart_id = cart_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public int getCart_amount() {
		return cart_amount;
	}

	public void setCart_amount(int cart_amount) {
		this.cart_amount = cart_amount;
	} 
	
}
