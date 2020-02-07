<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 

 	
	<div id="wrap">	
		 
		<c:if test="${faqListSize eq 0 }">
			등록된 메뉴가 없습니다.
		</c:if>
		
		 <c:forEach var="faqDto" items="${faqList }" >	
			<div id="목록" style="float:left; padding:20px;" >		
				<ul style="list-style-type:none;">		 
					<li>		 	
						<a href="faqView?faq_no=${faqDto.faq_title}"><br/>	 
					    <span> ${productDto.product_content } </span><br/>
						</a>		 	
					</li>		  
				</ul>		 
			</div>
		</c:forEach> 

	</div>
	
	
	
	
	
	
	
	
	
 
	
	
	

