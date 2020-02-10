package com.koreait.foodit.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.foodit.command.faq.FaqCommand;
import com.koreait.foodit.command.faq.FaqDeleteCommand;
import com.koreait.foodit.command.faq.FaqListCommand;
import com.koreait.foodit.command.faq.FaqModifyCommand;
import com.koreait.foodit.command.faq.FaqSearchCommand;
import com.koreait.foodit.command.faq.FaqViewCommand;
import com.koreait.foodit.command.faq.FaqWriteCommand;
import com.koreait.foodit.dao.FaqDao;
import com.koreait.foodit.dto.FaqDto;
import com.koreait.foodit.paging.Paging;

@Controller
public class FaqController {

	
	@Autowired
	private SqlSession sqlSession;
	private FaqCommand faqCommand;
	
	@RequestMapping("faqList")
	public String faqList(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		faqCommand = new FaqListCommand();
		faqCommand.execute(sqlSession, model);
		return "faq/faqList";
	}
	
	@RequestMapping("faqView")
	public String view(HttpServletRequest request, Model model) {
		model.addAttribute("request", request); 
		faqCommand = new FaqViewCommand();
		faqCommand.execute(sqlSession, model);
		return "faq/faqView";
	}
	
	@RequestMapping(value="faqModify", method=RequestMethod.POST)
	public String faqModify(RedirectAttributes attributes,
			                HttpServletRequest request,
			                Model model) {
		
		model.addAttribute("request", request);
		model.addAttribute("attributes", attributes);
		
		faqCommand = new FaqModifyCommand();
		faqCommand.execute(sqlSession, model);
		return "redirect:faqList"; 
	}

	@RequestMapping("faqWritePage")
	public String faqWritePage() {
		return "faq/faqWritePage";
	}
	
	@RequestMapping(value="faqWrite", method = RequestMethod.POST)
	public String faqWrite(RedirectAttributes attributes,
			               HttpServletRequest request, 
			               Model model) {
		
		model.addAttribute("request", request);
		model.addAttribute("attributes",attributes);
		faqCommand = new FaqWriteCommand();
		faqCommand.execute(sqlSession, model);
		return "redirect:faqList";
	}
	
	@RequestMapping("faqDelete")
	public String faqDelete(RedirectAttributes attributes,
			             HttpServletRequest request,
			             Model model) {
		model.addAttribute("request", request);
		model.addAttribute("attributes", attributes);
		faqCommand = new FaqDeleteCommand();
		faqCommand.execute(sqlSession, model);
		return "redirect:faqList";
	}
	
	@RequestMapping("faqSearchResult")
	public String faqSearchresult(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		faqCommand = new FaqSearchCommand();
		faqCommand.execute(sqlSession, model);
		return "faq/faqList";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping (value="faqSelect", produces="application/json; charset=UTF-8" )
	@ResponseBody
	public String faqSelect(@RequestParam("faq_category") String faq_category, HttpServletRequest request, Model model) {
		FaqDao fDao = sqlSession.getMapper(FaqDao.class);
		ArrayList<FaqDto> list = null;
		int listSize = 0;
		// 현재 페이지 번호 구하기 (파라미터로 전달)
		String currentPage = request.getParameter("currentPage");
		int nowPage = 1; // 기본 페이지 번호는 1로 정함
		if ( currentPage != null && !currentPage.isEmpty() ) {
			nowPage = Integer.parseInt(currentPage);
		}
		// 현재 페이지 번호를 알면
		// 현재 페이지에 표시되는 게시글을 시작 번호와 끝 번호를 알 수 있다.
		// 추가로 페이지 당 게시글 수(recordPerPage)를 알아야 한다.
		int recordPerPage = 8;
		int begin = (nowPage - 1) * recordPerPage + 1;
		int end = begin + recordPerPage - 1;
		//전체 게시글 개수 구하기 
		int totalRecord = fDao.totalCountReview();
		int selectRecord = fDao.selectTotalCount(faq_category);
		System.out.println(totalRecord + "" + selectRecord);
		// ◀ 1 2 3 ▶ 생성 (pagingView)
		String pagingView = null; 
		
		if ( faq_category.equals("faqList")) {
			list = fDao.faqList(begin, end);
			listSize = fDao.faqList(begin, end).size();
			pagingView = Paging.getPaging("faqList", nowPage, recordPerPage, totalRecord);
		} else {
			list = fDao.faqSelect(faq_category, begin, end);
			listSize = fDao.faqSelect(faq_category, begin, end).size();
			pagingView = Paging.getPaging("faqSelect", nowPage, recordPerPage, selectRecord);
		}
		JSONObject obj = new JSONObject();
		JSONArray jArray = new JSONArray();
		for(int i = 0; i < list.size(); i++) {
			JSONObject fObject = new JSONObject();
			fObject.put("faq_no", list.get(i).getFaq_no() );
			fObject.put("faq_title", list.get(i).getFaq_title());
			fObject.put("faq_content", list.get(i).getFaq_content());
			fObject.put("faq_category", list.get(i).getFaq_category());
			jArray.add(fObject);
		}
		obj.put("data", jArray);
		obj.put("listSize", listSize);
		obj.put("pagingView", pagingView);
        return obj.toJSONString();
	}
	
	
}
