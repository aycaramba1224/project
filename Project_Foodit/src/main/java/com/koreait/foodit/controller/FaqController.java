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

@Controller
public class FaqController {

	
	@Autowired
	private SqlSession sqlSession;
	private FaqCommand faqCommand;
	
	@RequestMapping("faqList")
	public String faqList(Model model) {
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
	
	@RequestMapping(value="faqSearchResult")
	public String faqSearchresult(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		faqCommand = new FaqSearchCommand();
		faqCommand.execute(sqlSession, model);
		return "faq/faqList";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping (value="faqSelect", produces="application/json; charset=UTF-8" )
	@ResponseBody
	public String faqSelect(@RequestParam("faq_category") String faq_category) {
		FaqDao fDao = sqlSession.getMapper(FaqDao.class);
		ArrayList<FaqDto> list = null;
		int listSize = 0;
		if ( faq_category.equals("faqList")) {
			list = fDao.faqList();
			listSize = fDao.faqList().size();
		} else {
			list = fDao.faqSelect(faq_category);
			listSize = fDao.faqSelect(faq_category).size();
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
        return obj.toJSONString();
	}
	
	
}
