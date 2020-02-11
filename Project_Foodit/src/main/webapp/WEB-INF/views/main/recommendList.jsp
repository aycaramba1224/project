<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

 
 	페이지 이동 
	<div>
	 	 
	 
	 
<ul style="list-style-type:none;">		 
<c:forEach var="productDto" items="${recommendList}" >	 
<li style="float:left; padding:20px; width:400px;">		 	
<a href="productView?product_no=${productDto.product_no}">	 
<!-- 상품 목록 썸네일 이미지 사이즈 : 366x366  -->
<span> <img alt="${productDto.product_thumbImg }" 
src="${pageContext.request.contextPath }/resources/upload/${productDto.product_thumbImg}" 
style="width:366px; height:366px;" /></span><br/>
<span> 상품 맛 : ${productDto.product_taste }</span>		
<span> ${productDto.product_name} </span><br/>
<span> <fmt:formatNumber value="${productDto.product_price}" pattern="#,###,###" />원 </span><br/> 									
	</a>		 	
</li>		  
</c:forEach> 		
</ul>
	 
	</div>
 
