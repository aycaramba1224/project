package com.koreait.foodit.dto;

import org.springframework.web.multipart.MultipartFile;

public class ProductDto {

	private int product_no;				// 상품 번호 (SEQ, PK)
	private String 	product_name,		// 상품명
					product_price,		// 상품 금액
					product_content,	// 상품 설명
					product_stock,		// 상품 재고
					product_taste,		// 상품 맛
					product_img,		// 상품 이미지(상세 이미지)
					product_thumbImg;	// 상품 썸네일
	
	private MultipartFile product_imgFile, product_thumbImgFile;
	
	public ProductDto() { }
	public ProductDto(int product_no, String product_name, String product_price, String product_content,
			String product_stock, String product_taste, String product_img, String product_thumbImg,
			MultipartFile product_imgFile, MultipartFile product_thumbImgFile) {
		super();
		this.product_no = product_no;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_content = product_content;
		this.product_stock = product_stock;
		this.product_taste = product_taste;
		this.product_img = product_img;
		this.product_thumbImg = product_thumbImg;
		this.product_imgFile = product_imgFile;
		this.product_thumbImgFile = product_thumbImgFile;
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
	public String getProduct_price() {
		return product_price;
	}
	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}
	public String getProduct_content() {
		return product_content;
	}
	public void setProduct_content(String product_content) {
		this.product_content = product_content;
	}
	public String getProduct_stock() {
		return product_stock;
	}
	public void setProduct_stock(String product_stock) {
		this.product_stock = product_stock;
	}
	public String getProduct_taste() {
		return product_taste;
	}
	public void setProduct_taste(String product_taste) {
		this.product_taste = product_taste;
	}
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	public String getProduct_thumbImg() {
		return product_thumbImg;
	}
	public void setProduct_thumbImg(String product_thumbImg) {
		this.product_thumbImg = product_thumbImg;
	}
	public MultipartFile getProduct_imgFile() {
		return product_imgFile;
	}
	public void setProduct_imgFile(MultipartFile product_imgFile) {
		this.product_imgFile = product_imgFile;
	}
	public MultipartFile getProduct_thumbImgFile() {
		return product_thumbImgFile;
	}
	public void setProduct_thumbImgFile(MultipartFile product_thumbImgFile) {
		this.product_thumbImgFile = product_thumbImgFile;
	}
	 
}
