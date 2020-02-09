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
 
	<div id="pd_wrap">	
		<h2 class="singleTit nbgB">FOODIT 메뉴</h2> 
 	 
		<c:if test="${mDto.role == 'admin' }">	<!-- 관리자만 보이는 부분   -->
			<input type="button" value="상품등록" onclick="location.href='productInsertPage'"/><br/><br/>   
		</c:if>
	 	
	 	<jsp:include page="/WEB-INF/views/product/menuOrder.jsp"/>	<!-- 상품 정렬  -->
 	 
 	 	<c:if test="${productListOrder2Size eq 0 }">
			등록된 메뉴가 없습니다.
		</c:if>	
		
		<c:forEach var="productDto" items="${productListOrder2 }" >	
			<div style="float:left; padding:20px; width:366px;" >			
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
	
	
	
	
	
	
	
 
	
	
	

