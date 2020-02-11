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
	var isProductModify = "${isProductModify}";
	if(isProductModify == "yes"){
		var modifyResult = "${modifyResult}";
		if(isProductModify == 0){
			alert("상품 등록이 실패하였습니다.");
		} else {
			alert("상품 등록이 성공하였습니다.");
		}
	}  

</script>
	<div id="pdWrap">	
	<h2 class="singleTit nbgB">FOODIT 메뉴</h2> 
	 	
	 	<div class="sortList">
			<div class="sortLwrap"><a href="productListOrder1">신메뉴</a></div>
			<div class="sortLwrap"><a href="productListOrder2">높은 가격 순</a></div>
			<div class="sortLwrap"><a href="productListOrder3">낮은 가격순</a></div>
			<div class="sortLwrap"><a class="on" href="productListOrder4">만족도순</a></div>
		</div>
	 	
	 	<c:if test="${productListSize eq 0 }">
			등록된 메뉴가 없습니다.
		</c:if>	 		
		
		
		
		<div class="menuListWrap">		
		
			<ul>		 
			<c:forEach var="productDto" items="${productList }" >	<!-- 가로정렬을 위해 임시 이렇게 설정했습니다. -->
				<li class="item">	
					<div class="proModule">	 	
						<div class="imgWrap">
							<a href="productView?product_no=${productDto.product_no}">
								<img alt="${productDto.product_thumbImg }" src="${pageContext.request.contextPath }/resources/upload/${productDto.product_thumbImg}" /> 
							</a>
						</div>	 
						<div class="txtWrap">							 
							<a href="productView?product_no=${productDto.product_no}">
								<div class="contInfo">
									<span class="contTxt"> ${productDto.product_content } </span>
								</div>
								<div class="titInfo">
									<span class="titTxt mtElps"> ${productDto.product_name} </span>
								</div>
								<div class="priceInfo">
									<p class="priceTxt"> 
										<span class="priceNum">
											<fmt:formatNumber value="${productDto.product_price}" pattern="#,###,###" />
											<span class="wonTxt">원</span>
										</span> 
									</p>
								</div>
								<div class="etcInfo">
									<div class="ratingWrap"> 
										<span class="ratingStar">
											<span class="star">
												<span>
												<!-- 별점 영역 -->
												별점
												</span>
											</span>
										</span>
										  
									</div>
									<div class="reviewNum">
										리뷰<!-- 여기에 EL 넣기 -->
									</div>
								</div> 
							</a>
						</div>
					</div>
				</li>		  
				</c:forEach> 
			</ul>		 
		</div>
	</div>
	
	<c:if test="${mDto.role == 'admin' }">	<!-- 관리자만 보이는 부분   -->
		<input type="button" value="상품등록" onclick="location.href='productInsertPage'"/><br/><br/>   
	</c:if>
	<div class="pageNavi">
		<div class="pagingWrap">
    		${pagingView }
   		</div>
   	</div>
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
