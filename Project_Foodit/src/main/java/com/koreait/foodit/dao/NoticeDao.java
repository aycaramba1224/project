
package com.koreait.foodit.dao;

import java.util.ArrayList;

import com.koreait.foodit.dto.NoticeDto;

public interface NoticeDao {

	
	
	public ArrayList<NoticeDto> noticeList();
    public NoticeDto noticeView(int notice_no);
	public int noticeModify(String notice_title, String notice_content,  int notice_no);
	public int noticeWrite(String notice_title, String notice_content, String notice_img);
	public int noticeDelete(int notice_no);
	public ArrayList<NoticeDto> noticeQuery(String query, String content);
}