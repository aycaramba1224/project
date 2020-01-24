package com.koreait.foodit.dto;

import java.sql.Date;

public class ReviewDto {

	private int re_no, re_pro_no;
	private Date re_date;
	private String 	re_id,
					re_pro_name,
					re_content,
					re_file,
					re_pw,
					re_score;
	
	public ReviewDto() { }
	public ReviewDto(int re_no, int re_pro_no, Date re_date, String re_id, String re_pro_name, String re_content,
			String re_file, String re_pw, String re_score) {
		super();
		this.re_no = re_no;
		this.re_pro_no = re_pro_no;
		this.re_date = re_date;
		this.re_id = re_id;
		this.re_pro_name = re_pro_name;
		this.re_content = re_content;
		this.re_file = re_file;
		this.re_pw = re_pw;
		this.re_score = re_score;
	}
	public int getRe_no() {
		return re_no;
	}
	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}
	public int getRe_pro_no() {
		return re_pro_no;
	}
	public void setRe_pro_no(int re_pro_no) {
		this.re_pro_no = re_pro_no;
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
	public String getRe_pro_name() {
		return re_pro_name;
	}
	public void setRe_pro_name(String re_pro_name) {
		this.re_pro_name = re_pro_name;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public String getRe_file() {
		return re_file;
	}
	public void setRe_file(String re_file) {
		this.re_file = re_file;
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
	
	
}
