package com.koreait.foodit.dto;

import java.sql.Date;

public class FaqDto {

	private int faq_no;
	private Date faq_date;
	private String 	faq_title, 
					faq_content, 
					faq_id, 
					classno;
	
	public FaqDto() { }
	public FaqDto(int faq_no, Date faq_date, String faq_title, String faq_content, String faq_id, String classno) {
		super();
		this.faq_no = faq_no;
		this.faq_date = faq_date;
		this.faq_title = faq_title;
		this.faq_content = faq_content;
		this.faq_id = faq_id;
		this.classno = classno;
	}
	

	public int getFaq_no() {
		return faq_no;
	}

	public void setFaq_no(int faq_no) {
		this.faq_no = faq_no;
	}

	public Date getFaq_date() {
		return faq_date;
	}

	public void setFaq_date(Date faq_date) {
		this.faq_date = faq_date;
	}

	public String getFaq_title() {
		return faq_title;
	}

	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}

	public String getFaq_content() {
		return faq_content;
	}

	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}

	public String getFaq_id() {
		return faq_id;
	}

	public void setFaq_id(String faq_id) {
		this.faq_id = faq_id;
	}

	public String getClassno() {
		return classno;
	}

	public void setClassno(String classno) {
		this.classno = classno;
	}
	
}
