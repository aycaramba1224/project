package com.koreait.foodit.command.product;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.foodit.dao.ProductDao;

public class MenuListCommand implements ProductCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		ProductDao productDao = sqlSession.getMapper(ProductDao.class);	
		 	   
		model.addAttribute("menuList", productDao.menuList()); 
		
	}

}
