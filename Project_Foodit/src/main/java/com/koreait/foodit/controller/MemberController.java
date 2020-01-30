package com.koreait.foodit.controller;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.foodit.command.member.MemberCommand;
import com.koreait.foodit.dao.MemberDao;
import com.koreait.foodit.dto.MemberDto;

@Controller
public class MemberController {
	
	// Field
	@Autowired
	public SqlSession sqlSession;
	public MemberCommand memberCommand;
	
	// Method
	@RequestMapping("sbm02")
	public String sbm02() {
		return "join/joinPage";
	}
	@RequestMapping("sbmr")
	public String sbmr() {
		return "login/loginPage";
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value="join", produces="application/json")
	@ResponseBody
	public String join(@RequestParam("id") String id,
					   @RequestParam("pw") String pw,
					   @RequestParam("name") String name,
					   @RequestParam("phone") String phone,
					   @RequestParam("email") String email,
					   @RequestParam("birth") String birth,
					   @RequestParam("post") String post,
					   @RequestParam("road") String road,
					   @RequestParam("addr") String addr) {
		road = road + " " + addr;
		MemberDao mDao = sqlSession.getMapper(MemberDao.class);
		int result = mDao.add(id, pw, name, phone, email, birth, post, road);
		JSONObject obj = new JSONObject();
		if(result > 0) {
			obj.put("result", "SUCCESS");
		} else {
			obj.put("result", "FAIL");
		}
		return obj.toJSONString();
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="idCheck", produces="application/json")
	@ResponseBody
	public String idCheck(@RequestParam("mId") String id) {
		MemberDao mDao = sqlSession.getMapper(MemberDao.class);
		MemberDto mDto = mDao.idCheck(id);
		JSONObject obj = new JSONObject();
		if( mDto != null ) {
			obj.put("result", "YES");
		} else {
			obj.put("result", "NO");
		}
		return obj.toJSONString();
	}
}
