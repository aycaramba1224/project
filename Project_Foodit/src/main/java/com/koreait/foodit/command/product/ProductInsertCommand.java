package com.koreait.foodit.command.product;

import java.util.Map;
import java.io.File;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.foodit.dao.ProductDao;

public class ProductInsertCommand implements ProductCommand {
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	
	@Override
	public void execute(SqlSession sqlSession, Model model) {

		ProductDao productDao = sqlSession.getMapper(ProductDao.class);
		
		Map<String, Object> map = model.asMap();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
		 
		String product_name = request.getParameter("product_name");
		String product_price = request.getParameter("product_price");
		String product_content = request.getParameter("product_content");
		String product_stock = request.getParameter("product_stock");
		String product_taste = request.getParameter("product_taste");	 		
		
		
		// 이미지 업로드 
		MultipartFile product_imgFile = request.getFile("product_img");  
		MultipartFile product_thumbImgFile = request.getFile("product_thumbImg");  
	
		String originFilename = product_imgFile.getOriginalFilename();
		String originFilename2 = product_thumbImgFile.getOriginalFilename();
		
		String extentionName = originFilename.substring(originFilename.lastIndexOf(".") + 1, originFilename.length());
		String extentionName2 = originFilename2.substring(originFilename2.lastIndexOf(".") + 1, originFilename2.length());
		
		String imgSaveFilename = null;
		String thumbImgSaveFilename = null;
		
		try { 
			
			imgSaveFilename = originFilename.substring(0, originFilename.lastIndexOf(".")) + "_" + "detail" + "." + extentionName;
			thumbImgSaveFilename = originFilename2.substring(0, originFilename2.lastIndexOf(".")) + "_" + "thumbnail"+ "." + extentionName2;
			
			// 업로드 할 파일이 저장될 경로(/resources/upload)를 알아낸다.
			String realPath = request.getSession().getServletContext().getRealPath("/resources/upload");	
			String realPath2 = request.getSession().getServletContext().getRealPath("/resources/upload");	
			 
			File directory = new File(realPath);  
			if ( !directory.exists() ) {
				directory.mkdirs(); 
			}			
			File directory2 = new File(realPath2);  
			if ( !directory2.exists() ) {
				directory2.mkdirs(); 
			}			

			File saveFile = new File(realPath, imgSaveFilename);
			product_imgFile.transferTo(saveFile);
			
			File saveFile2 = new File(realPath2, thumbImgSaveFilename);
			product_thumbImgFile.transferTo(saveFile2);			
			 
			RedirectAttributes redirectAttributes = (RedirectAttributes)map.get("redirectAttributes");
			redirectAttributes.addFlashAttribute("insertResult", productDao.productInsert(product_name, product_price, product_content, product_stock,
					product_taste, imgSaveFilename, thumbImgSaveFilename));
			redirectAttributes.addFlashAttribute("isProductInsert", "yes");
				
		} catch (Exception e) {
			e.printStackTrace();
		}		
 
	}	
	
}
