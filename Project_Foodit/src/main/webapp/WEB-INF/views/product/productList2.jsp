<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 

 	
	<div id="wrap">	
		<c:if test=" ">
		 <!-- 관리자만 보이는 부분  (처리예정) -->
		 <input type="button" value="상품등록" onclick="location.href='productInsertPage'"/>
		 <!--------------------------->
		</c:if>
		<c:if test="${productListSize eq 0 }">
			등록된 메뉴가 없습니다.
		</c:if>	 
		 <ul style="list-style-type:none;">		 
		 <c:forEach var="productDto" items="${productList }" >		 
		 	<li  style="float:left; padding:20px;" >		 	
			 	<div id="목록">
			 		<div id="제품">
		 				<a href="productView?product_no=${productDto.product_no}">
		 					<!-- 상품 목록 썸네일 이미지 사이즈 : 366x366  -->
					 		<p> <img alt="${productDto.product_thumbImg }" src="${pageContext.request.contextPath }/resources/upload/${productDto.product_thumbImg}" style="width:366px; height:366px;" />	  </p> 
					 		<p> ${productDto.product_name} </p> 
					 		<p> <fmt:formatNumber value="${productDto.product_price}" pattern="#,###,###" />원  </p> 
					 		<p> 별점 &nbsp;|&nbsp; 리뷰글수 </p> 					 		  	 
				 		</a>
			 		</div>		 		
			 	</div>		 	
		 	</li>		  
		 </c:forEach>
		 </ul>		 
		 
		 
	</div>
	
	
	
	
	
	
	
	
	
 
	
	
	
