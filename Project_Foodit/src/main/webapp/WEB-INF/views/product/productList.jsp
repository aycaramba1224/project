<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="/WEB-INF/views/common/header.jsp" >
	<jsp:param value="FOODIT 메뉴" name="title"/>
</jsp:include>

<script type="text/javascript"> 
	var isProductInsert = "${isProductInsert}";
	if(isProductInsert == "yes"){
		var insertResult = "${insertResult}";
		if(insertResult == 0){
			alert("상품 등록이 실패하였습니다.");
		} else {
			alert("상품 등록이 성공하였습니다.");
		}
	} 
</script>
 
 	 FOODIT 메뉴 
 	
 	<div id="메뉴바">
 		<a>높은 가격 순</a> | <a>낮은 가격순</a> | <a>인기메뉴순</a> | <a>만족도순</a> 
 	</div>
 	
	<div id="wrap">	
		 <!-- 관리자만 보이는 부분  (처리예정) -->
		 <input type="button" value="상품등록" onclick="location.href='productInsertPage'"/>
		 <!--------------------------->
			 
		 <ul style="list-style-type:none;">		 
		 <c:forEach var="productDto" items="${productList }" >		 
		 	<li  style="float:left;" >		 	
			 	<div id="목록">
			 		<a href="productView?product_no=${productDto.product_no}">
				 		<div id="제품">
					 		<p> 썸네일이미지 </p> 
					 		<p> ${productDto.product_name} </p> 
					 		<p> <fmt:formatNumber value="${productDto.product_price}" pattern="#,###,###" />원  </p> 
					 		<p> 별점 &nbsp;|&nbsp; 리뷰글수 </p> 
					 		<p> 찜하기  &nbsp;|&nbsp; <input type="button" value="장바구니 담기" onclick="goCart(this.form)"/> </p> 
				 		</div>		 		
			 		</a>		 		
			 	</div>		 	
		 	</li>		  
		 </c:forEach>
		 </ul>		 
	</div>
	

