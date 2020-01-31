package com.koreait.foodit.dto;

public class GuestDto {
	
	private String 	guest_id,
					guest_pw, 
					guest_name,
					guest_phone;
	
	public GuestDto() {	}
	public GuestDto(String guest_id, String guest_pw, String guest_name, String guest_phone) {
		super();
		this.guest_id = guest_id;
		this.guest_pw = guest_pw;
		this.guest_name = guest_name;
		this.guest_phone = guest_phone;
	}
	

	public String getGuest_id() {
		return guest_id;
	}

	public void setGuest_no(String guest_id) {
		this.guest_id = guest_id;
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
