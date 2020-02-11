<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

 
 
	<div id="pd_wrap">	
	<h2 class="singleTit nbgB">실시간 베스트</h2> 
	 
		<ul style="list-style-type:none;">		 
			<c:forEach var="productDto" items="${bestList }" begin="1" end="6">	<!-- 가로정렬을 위해 임시 이렇게 설정했습니다. -->
				<li style="float:left; padding:20px; width:400px;">		 	
					<a href="productView?product_no=${productDto.product_no}">	 
						<!-- 상품 목록 썸네일 이미지 사이즈 : 366x366  -->
						<span> <img alt="${productDto.product_thumbImg }" 
								src="${pageContext.request.contextPath }/resources/upload/${productDto.product_thumbImg}" 
								style="width:366px; height:366px;" /></span><br/>
						<span> ${productDto.product_name} </span><br/>
						<span> <fmt:formatNumber value="${productDto.product_price}" pattern="#,###,###" />원 </span><br/> 									
					</a>		 	
				</li>		  
				</c:forEach> 		
			</ul>
	 
	</div>

