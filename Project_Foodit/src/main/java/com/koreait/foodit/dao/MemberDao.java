package com.koreait.foodit.dao;

import java.util.ArrayList;

import com.koreait.foodit.dto.MemberDto;

public interface MemberDao {
	
	
	public int add(String id, String pw, String name, 
					String phone, String email, String birth, 
					String post, String road);
	
	public MemberDto idCheck(String id); 
	public MemberDto memLogin(String id, String pw);
	public MemberDto findId(String name, String birth, String phone);
	public MemberDto findPw(String id, String birth, String phone);
	public int ranPw(String ranPw, String id);
	public MemberDto memModiPw(String pw);
	public int memModi(String pw, String phone, String email, String birth, String id);
	public int memDel(String id);
	public ArrayList<MemberDto> adminMemberList();
}
