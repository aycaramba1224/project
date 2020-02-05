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
	
	function addCart(f){
		var check = confirm("상품이 장바구니에 담겼습니다.장바구니로 이동하시겠습니까?");
		if (check) {
			f.action ="cartInsert?product_no=${productDto.product_no }";	
			f.submit();	
		}
	}
</script>
 
 	 FOODIT 메뉴 
 	
 	<div id="메뉴바">
 		<a href="productList">높은 가격 순</a> | <a>낮은 가격순</a> | <a>인기메뉴순</a> | <a>만족도순</a> <!--처리예정 -->
 	</div>
 	
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
	
	
	
	
	
	
	
	
	
 
	
	
	

