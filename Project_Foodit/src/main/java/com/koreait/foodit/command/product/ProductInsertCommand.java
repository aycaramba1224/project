package com.koreait.foodit.command.product;

import java.util.List;
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
		List<MultipartFile> uploadFileList = request.getFiles("file_");
		int size = uploadFileList.size();

		if ( uploadFileList != null && size > 0 ) {
			for (MultipartFile multiFile : uploadFileList) {
				if ( !multiFile.isEmpty() ) {
					String originFilename = multiFile.getOriginalFilename();
					String extentionName = originFilename.substring(originFilename.lastIndexOf(".") + 1, originFilename.length());
					String saveFilename = null;
					try {
						saveFilename = originFilename.substring(0, originFilename.lastIndexOf(".")) + "_" + System.currentTimeMillis() + "." + extentionName;
						String realPath = request.getSession().getServletContext().getRealPath("/resources/upload");
						File directory = new File(realPath);
						if ( !directory.exists() ) {
							directory.mkdirs();
						}
						File saveFile = new File(realPath, saveFilename);
						multiFile.transferTo(saveFile);
						RedirectAttributes redirectAttributes = (RedirectAttributes)map.get("redirectAttributes");
						redirectAttributes.addFlashAttribute("insertResult", productDao.productInsert(product_name, product_price, product_content, product_stock,
								product_taste, saveFilename, saveFilename));
						redirectAttributes.addFlashAttribute("isProductInsert", "yes");
						 
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}		 
 
	}	
	
}
