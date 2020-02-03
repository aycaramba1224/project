package com.koreait.foodit.dao;

import com.koreait.foodit.dto.MemberDto;

public interface MemberDao {
	
	
	public int add(String id, String pw, String name, 
					String phone, String email, String birth, 
					String post, String road);
	
	public MemberDto idCheck(String id); 
	public MemberDto memLogin(String id, String pw);
}
