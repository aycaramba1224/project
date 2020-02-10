<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 

  
		 
		 
		 	<div class="detail">
					<div class="detail_info">
						<div class="no_data">
							<span class="ico"></span>
		 
		<c:if test="${productListSize eq 0 }">
			등록된 메뉴가 없습니다.
		</c:if>
		</div></div>
		
		 <c:forEach var="productDto" items="${productList }" >	
			<div id="목록" style="float:left; padding:20px;" >		
				<ul style="list-style-type:none;">		 
					<li>		 	
						<a href="productView?product_no=${productDto.product_no}">	 
							<!-- 상품 목록 썸네일 이미지 사이즈 : 366x366  -->
							<span> <img alt="${productDto.product_thumbImg }" 
									src="${pageContext.request.contextPath }/resources/upload/${productDto.product_thumbImg}" 
									style="width:366px; height:366px;" /></span><br/>
							<span> ${productDto.product_name} </span><br/>
							<span> <fmt:formatNumber value="${productDto.product_price}" pattern="#,###,###" />원 </span><br/> 
							<span> ${productDto.product_content } </span><br/>
							<span> 별점 &nbsp;|&nbsp; 리뷰글수 </span> 
						</a>		 	
					</li>		  
				</ul>		 
			</div>
		</c:forEach> 

	</div>
	
	<br />
    ${pagingView }
    <br />
	
	
 
 
	  			  
 
	
	
 
	
	
	

