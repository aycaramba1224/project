package com.koreait.foodit.command.review;

import java.io.File;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.foodit.dao.ReviewDao;

public class ReviewWriteCommand implements ReviewCommand {

	@Resource(name="uploadPath")
	private String uploadPath; 
	
	
	
	@Override
	public void execute(SqlSession sqlSession, Model model) {

		ReviewDao rDao = sqlSession.getMapper(ReviewDao.class); 
		
		Map<String, Object> map = model.asMap(); 
        
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
		
		String re_product_name = request.getParameter("re_product_name"); 
		String re_id = request.getParameter("re_id"); 
		String re_content = request.getParameter("re_content"); 
		String re_pw = request.getParameter("re_pw"); 
		String re_score = request.getParameter("re_score");
	    int re_product_no = Integer.parseInt(request.getParameter("re_product_no"));
		
	    MultipartFile re_imgFile = request.getFile("refile_"); 
		String originFilename = re_imgFile.getOriginalFilename();
		String extentionName = originFilename.substring(originFilename.lastIndexOf(".") + 1, originFilename.length()); 
		String imgSaveFileName = null; 
		
		try {
			
			imgSaveFileName = originFilename.substring(0,originFilename.lastIndexOf(".")) + "_" + "detail" + "." + extentionName;
		    
		    // 업로드 할 파일이 저장될 경로 
		   String realPath = request.getSession().getServletContext().getRealPath("/resources/upload");
		
		
		   File directory = new File(realPath);
		   if( !directory.exists()) {
			   directory.mkdirs();
		   }
		   
		   File saveFile = new File(realPath, imgSaveFileName);
		   			re_imgFile.transferTo(saveFile);
		   

		   RedirectAttributes attributes = (RedirectAttributes)map.get("redirectAttributes");
		   attributes.addFlashAttribute("reviewWriteRes", rDao.reviewWrite(re_id, re_product_name, re_content, re_pw, re_score, re_product_no, imgSaveFileName));
		   attributes.addFlashAttribute("isReviewWrite", "Yes");
		   
		   
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}