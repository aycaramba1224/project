package com.koreait.foodit.dto;

import java.sql.Date;

public class NoticeDto {

	private int notice_no;
	private Date notice_date;
	private String	notice_title,
					notice_content,
					notice_id;
	
	public NoticeDto() { }
	public NoticeDto(int notice_no, Date notice_date, String notice_title, String notice_content, String notice_id) {
		super();
		this.notice_no = notice_no;
		this.notice_date = notice_date;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_id = notice_id;
	}
	
	
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	public Date getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(String notice_id) {
		this.notice_id = notice_id;
	}
	
}
