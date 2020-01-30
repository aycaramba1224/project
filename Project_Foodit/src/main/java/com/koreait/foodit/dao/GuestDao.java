package com.koreait.foodit.dao;

import java.util.ArrayList;

import com.koreait.foodit.dto.GuestDto;

public interface GuestDao {
	
 public ArrayList<GuestDto> guestList();
public int guestInsert(String guest_id,String guest_pw,String guest_name,String guest_phone);
public GuestDto guestListView(String guest_id);
public int guestDelete(String guest_id);
public int guestModify(String guest_pw,String guest_name,String guest_phone,String guest_id);
}
