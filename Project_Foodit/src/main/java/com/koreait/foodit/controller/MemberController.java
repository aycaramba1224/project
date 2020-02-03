package com.koreait.foodit.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	@RequestMapping("memLogin")
	public String memLogin (HttpSession session, RedirectAttributes rtts, HttpServletRequest request, 
						   Cookie cookie, HttpServletResponse response, Model model) {
		String urlPath = "";
		MemberDao mDao = sqlSession.getMapper(MemberDao.class);
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String isChecked = request.getParameter("isChecked");
		MemberDto idCheckResult = mDao.idCheck(id);
		MemberDto idPwCheckResult = mDao.memLogin(id, pw);
		if ( session.getAttribute("mDto") != null ){  // 기존에 mDto이란 세션 값이 존재한다면
            session.removeAttribute("mDto"); // 기존값을 제거해 준다.
        }
		// 로그인 성공.(세션 설정)
		if( idPwCheckResult != null ) {    
			session = request.getSession();
			session.setAttribute("mDto", idPwCheckResult);
			urlPath = "redirect:index";
			// 쿠키 설정.
			if( isChecked != null ) {    // 아이디 저장을 체크했을 경우.      
				cookie = new Cookie("loginCookie", session.getId());
				cookie.setMaxAge(60 * 60 * 24 * 3);  // 쿠키 유효기간은 3일로 설정.
				response.addCookie(cookie);
			} else {    // 아이디 기억하기를 체크하지 않았다면
				Cookie[] cookieBox = request.getCookies(); // session에 저장되어있는 id 쿠키 확인 후 삭제
				if( cookieBox != null && cookieBox.length > 0 ) {
					for( Cookie ck : cookieBox ) {
						if( ck.getName().equals("loginCookie") ) {
							Cookie bisket = new Cookie("loginCookie", "");
							bisket.setMaxAge(0);
							response.addCookie(bisket);
							break;
						}
					}
				}
			}
		} else { // 로그인 실패.
			if( idCheckResult == null ) { // 일치하는 아이디가 없을 때
				rtts.addFlashAttribute("flag", "1");	// 	
				rtts.addFlashAttribute("idCheckResult", idCheckResult);
				urlPath = "redirect:sbmr";
			} else { // 아이디 비밀번호 틀렸을 때 
				rtts.addFlashAttribute("flag", "2");
				rtts.addFlashAttribute("idPwCheckResult", idPwCheckResult);
				urlPath = "redirect:sbmr";
			}
		}
		
//		memberCommand = new MemberLoginCommand();
//		memberCommand.execute(sqlSession, model);
		return urlPath;
	}
	
	@RequestMapping("logout")
	public String logout(RedirectAttributes rtts, HttpSession session) {
		session.invalidate(); // 세션 전체를 초기화
		rtts.addFlashAttribute("isLogout", "yes");
        return "redirect:index"; // 로그아웃 후 index(메인 페이지)로 이동
	}
}
