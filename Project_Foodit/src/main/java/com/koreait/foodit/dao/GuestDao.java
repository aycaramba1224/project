package com.koreait.foodit.dao;

import java.util.ArrayList;

import com.koreait.foodit.dto.GuestDto;

public interface GuestDao {
	
 public ArrayList<GuestDto> guestList();
public int guestInsert(int guest_no,String guest_pw,String guest_name,String guest_phone);
public GuestDto guestListView(int guest_no);
public int guestDelete(int guest_no);
public int guestModify(String guest_pw,String guest_name,String guest_phone,int guest_no);
}
