package com.koreait.foodit.controller;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class GuestController {

	@RequestMapping("guestindex")
	public String guestindexPage() {
		return "guest/guestindex";
	}
	
	@RequestMapping(value="jsonGet", produces="application/json")
	@ResponseBody // 리턴을 response 에 담아서 보내라. (리턴이 뷰가 아니다.)
	public String jsonGet() {
		
		JSONObject obj = new JSONObject(); 
		return obj.toJSONString(); 
		
	}
}
