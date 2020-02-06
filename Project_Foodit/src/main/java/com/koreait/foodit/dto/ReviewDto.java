package com.koreait.foodit.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class ReviewDto {

	private int re_no, re_product_no;
	private Date re_date;
	private String 	re_id,
					re_product_name,
					re_content,
					re_img,
					re_thumbImg,
					re_pw,
					re_score;	
	private MultipartFile review_imgFile, review_thumbImgFile;  
	
	public ReviewDto() { }

	public ReviewDto(int re_no, int re_product_no, Date re_date, String re_id, String re_product_name,
			String re_content, String re_img, String re_thumbImg, String re_pw, String re_score,
			MultipartFile review_imgFile, MultipartFile review_thumbImgFile) {
		super();
		this.re_no = re_no;
		this.re_product_no = re_product_no;
		this.re_date = re_date;
		this.re_id = re_id;
		this.re_product_name = re_product_name;
		this.re_content = re_content;
		this.re_img = re_img;
		this.re_thumbImg = re_thumbImg;
		this.re_pw = re_pw;
		this.re_score = re_score;
		this.review_imgFile = review_imgFile;
		this.review_thumbImgFile = review_thumbImgFile;
	}

	public int getRe_no() {
		return re_no;
	}

	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}

	public int getRe_product_no() {
		return re_product_no;
	}

	public void setRe_product_no(int re_product_no) {
		this.re_product_no = re_product_no;
	}

	public Date getRe_date() {
		return re_date;
	}

	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}

	public String getRe_id() {
		return re_id;
	}

	public void setRe_id(String re_id) {
		this.re_id = re_id;
	}

	public String getRe_product_name() {
		return re_product_name;
	}

	public void setRe_product_name(String re_product_name) {
		this.re_product_name = re_product_name;
	}

	public String getRe_content() {
		return re_content;
	}

	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}

	public String getRe_img() {
		return re_img;
	}

	public void setRe_img(String re_img) {
		this.re_img = re_img;
	}

	public String getRe_thumbImg() {
		return re_thumbImg;
	}

	public void setRe_thumbImg(String re_thumbImg) {
		this.re_thumbImg = re_thumbImg;
	}

	public String getRe_pw() {
		return re_pw;
	}

	public void setRe_pw(String re_pw) {
		this.re_pw = re_pw;
	}

	public String getRe_score() {
		return re_score;
	}

	public void setRe_score(String re_score) {
		this.re_score = re_score;
	}

	public MultipartFile getReview_imgFile() {
		return review_imgFile;
	}

	public void setReview_imgFile(MultipartFile review_imgFile) {
		this.review_imgFile = review_imgFile;
	}

	public MultipartFile getReview_thumbImgFile() {
		return review_thumbImgFile;
	}

	public void setReview_thumbImgFile(MultipartFile review_thumbImgFile) {
		this.review_thumbImgFile = review_thumbImgFile;
	}
	
	
 
}
