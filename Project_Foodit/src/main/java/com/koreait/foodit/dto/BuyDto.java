package com.koreait.foodit.dto;

public class BuyDto {

	private int buy_no, 
				buy_pro_no;
	private String	buy_id, 
					buy_count;
	
	public BuyDto() { }
	public BuyDto(int buy_no, int buy_pro_no, String buy_id, String buy_count) {
		super();
		this.buy_no = buy_no;
		this.buy_pro_no = buy_pro_no;
		this.buy_id = buy_id;
		this.buy_count = buy_count;
	}
	

	public int getBuy_no() {
		return buy_no;
	}

	public void setBuy_no(int buy_no) {
		this.buy_no = buy_no;
	}

	public int getBuy_pro_no() {
		return buy_pro_no;
	}

	public void setBuy_pro_no(int buy_pro_no) {
		this.buy_pro_no = buy_pro_no;
	}

	public String getBuy_id() {
		return buy_id;
	}

	public void setBuy_id(String buy_id) {
		this.buy_id = buy_id;
	}

	public String getBuy_count() {
		return buy_count;
	}

	public void setBuy_count(String buy_count) {
		this.buy_count = buy_count;
	}
	
}
