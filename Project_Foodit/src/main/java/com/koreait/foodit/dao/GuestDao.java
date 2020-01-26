package com.koreait.foodit.dao;

import java.util.ArrayList;

import com.koreait.foodit.dto.GuestDto;

public interface GuestDao {

   public ArrayList<GuestDto>guestList();
	public int guestInsert(int guest_no,String guest_pw,String guest_name,String guest_phone);
}
