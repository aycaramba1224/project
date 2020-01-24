package com.koreait.foodit.dto;

public class ProductDto {

	private int pro_no, order_pro_no;
	private String 	pro_name,
					pro_price,
					pro_content,
					pro_stock,
					pro_taste;
	
	public ProductDto() { }
	public ProductDto(int pro_no, int order_pro_no, String pro_name, String pro_price, String pro_content,
			String pro_stock, String pro_taste) {
		super();
		this.pro_no = pro_no;
		this.order_pro_no = order_pro_no;
		this.pro_name = pro_name;
		this.pro_price = pro_price;
		this.pro_content = pro_content;
		this.pro_stock = pro_stock;
		this.pro_taste = pro_taste;
	}
	
	public int getPro_no() {
		return pro_no;
	}
	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}
	public int getOrder_pro_no() {
		return order_pro_no;
	}
	public void setOrder_pro_no(int order_pro_no) {
		this.order_pro_no = order_pro_no;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getPro_price() {
		return pro_price;
	}
	public void setPro_price(String pro_price) {
		this.pro_price = pro_price;
	}
	public String getPro_content() {
		return pro_content;
	}
	public void setPro_content(String pro_content) {
		this.pro_content = pro_content;
	}
	public String getPro_stock() {
		return pro_stock;
	}
	public void setPro_stock(String pro_stock) {
		this.pro_stock = pro_stock;
	}
	public String getPro_taste() {
		return pro_taste;
	}
	public void setPro_taste(String pro_taste) {
		this.pro_taste = pro_taste;
	}
	
}
