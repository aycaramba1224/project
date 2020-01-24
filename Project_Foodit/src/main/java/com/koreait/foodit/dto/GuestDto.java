package com.koreait.foodit.dto;

public class GuestDto {

	private int guest_no;
	private String 	guest_pw, 
					guest_name,
					guest_phone;
	
	public GuestDto() {	}
	public GuestDto(int guest_no, String guest_pw, String guest_name, String guest_phone) {
		super();
		this.guest_no = guest_no;
		this.guest_pw = guest_pw;
		this.guest_name = guest_name;
		this.guest_phone = guest_phone;
	}
	

	public int getGuest_no() {
		return guest_no;
	}

	public void setGuest_no(int guest_no) {
		this.guest_no = guest_no;
	}

	public String getGuest_pw() {
		return guest_pw;
	}

	public void setGuest_pw(String guest_pw) {
		this.guest_pw = guest_pw;
	}

	public String getGuest_name() {
		return guest_name;
	}

	public void setGuest_name(String guest_name) {
		this.guest_name = guest_name;
	}

	public String getGuest_phone() {
		return guest_phone;
	}

	public void setGuest_phone(String guest_phone) {
		this.guest_phone = guest_phone;
	}
	
}
