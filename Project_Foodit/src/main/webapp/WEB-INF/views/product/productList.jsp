<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 목록</title>
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
</head>
<body>
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
</body>
</html>