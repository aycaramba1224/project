package com.koreait.foodit.dto;

public class MemberOptDto {

	private int member_no;
	private String	member_id,
				  	member_taste,
				  	member_oder_list;
	
	public MemberOptDto() {	}
	public MemberOptDto(int member_no, String member_id, String member_taste, String member_oder_list) {
		super();
		this.member_no = member_no;
		this.member_id = member_id;
		this.member_taste = member_taste;
		this.member_oder_list = member_oder_list;
	}
	
	
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_taste() {
		return member_taste;
	}
	public void setMember_taste(String member_taste) {
		this.member_taste = member_taste;
	}
	public String getMember_oder_list() {
		return member_oder_list;
	}
	public void setMember_oder_list(String member_oder_list) {
		this.member_oder_list = member_oder_list;
	}
	
}
