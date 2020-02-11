package com.koreait.foodit.command.notice;

import java.io.File;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.foodit.dao.NoticeDao;

public class NoticeWriteCommand implements NoticeCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		 NoticeDao nDao = sqlSession.getMapper(NoticeDao.class); 
	       
	       Map<String, Object> map = model.asMap();
	       
	       MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
	       String notice_title = request.getParameter("notice_title"); 
	       String notice_content= request.getParameter("notice_content");
           	
			
	    // 이미지 업로드 

	       MultipartFile product_imgFile = request.getFile("file_");  
	       String originFilename = product_imgFile.getOriginalFilename();
	       String extentionName = originFilename.substring(originFilename.lastIndexOf(".") + 1, originFilename.length());
	       String imgSaveFilename = null;
	       
			try {
			imgSaveFilename = originFilename.substring(0, originFilename.lastIndexOf(".")) + "_" + "detail" + "." + extentionName;

			String realPath = request.getSession().getServletContext().getRealPath("/resources/upload");	

			File directory = new File(realPath);  	
						if ( !directory.exists() ) {	
							directory.mkdirs(); 	
						}			

			File saveFile = new File(realPath, imgSaveFilename);			
						product_imgFile.transferTo(saveFile);			

			

			} catch (Exception e) {								
						e.printStackTrace();							
					}			

			RedirectAttributes redirectAttributes = (RedirectAttributes)map.get("redirectAttributes");
			redirectAttributes.addFlashAttribute("noticeWriteResult", nDao.noticeWrite(notice_title, notice_content, imgSaveFilename));
			redirectAttributes.addFlashAttribute("isNoticeInsert", "Yes");
			
			
		}	
		
	}


