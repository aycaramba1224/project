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
	<div id="wrap">	
 	 
		<c:if test="${mDto.role == 'admin' }">	<!-- 관리자만 보이는 부분   -->
			<input type="button" value="상품등록" onclick="location.href='productInsertPage'"/><br/><br/>   
		</c:if>
	 	
	 	<div id="메뉴바">
	 		<a>신메뉴</a> | <a href=" ">높은 가격 순</a> | <a>낮은 가격순</a> | <a>만족도순</a> <!--처리예정 -->
	 	</div>
 	
		<c:if test="${productListSize eq 0 }">
			등록된 메뉴가 없습니다.
		</c:if>	 
		
		
		
		<c:forEach var="productDto" items="${productList }" >	
			<div id="목록" style="float:left; padding:20px;" >		
				<ul style="list-style-type:none;">		 
					<li>		 	
						<a href="productView?product_no=${productDto.product_no}">	 
							<!-- 상품 목록 썸네일 이미지 사이즈 : 366x366  -->
							<p> <img alt="${productDto.product_thumbImg }" src="${pageContext.request.contextPath }/resources/upload/${productDto.product_thumbImg}" style="width:366px; height:366px;" /></p> 
							<p> ${productDto.product_name} </p> 
							<p> <fmt:formatNumber value="${productDto.product_price}" pattern="#,###,###" />원  </p> 
							<p> 별점 &nbsp;|&nbsp; 리뷰글수 </p>	  	 
						</a>		 	
					</li>		  
				</ul>		 
			</div>
		</c:forEach> 
		 
	</div>
	
	
	
	
	
	
	
	
	
 
	
	
	

