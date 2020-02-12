
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<jsp:include page="/WEB-INF/views/common/header.jsp" >
    <jsp:param value="한끼도 특별하게, FOODIT " name="title"/>
</jsp:include>  
 
	<div> <!--------- 이미지 슬라이드 --------->	
		<div class="slideshow-container">
		
			<div class="mySlides fade">
			  <div class="numbertext">1 / 3</div>
			  <img src="./resources/main/poster1.jpg" style="width:100%">
			 
			</div>
			
			<div class="mySlides fade">
			  <div class="numbertext">2 / 3</div>
			  <img src="./resources/main/poster2.jpg" style="width:100%">
			 
			</div>
			
			<div class="mySlides fade">
			  <div class="numbertext">3 / 3</div>
			  <img src="./resources/main/poster3.jpg" style="width:100%">
			 
			</div>
			
			<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
			<a class="next" onclick="plusSlides(1)">&#10095;</a>
			
		</div>
	
	</div> 
	 
 	<div><!--------- 실시간 베스트  --------->	
		<div id="pdWrap">	
			<h2 class="singleTit nbgB">실시간 베스트</h2>			
			
			<div class="menuListWrap">		
			
				<ul>		 
				<c:forEach var="productDto" items="${bestList }" begin="1" end="6">	<!-- 가로정렬을 위해 임시 이렇게 설정했습니다. -->
					<li class="item">	
						<div class="proModule">	 	
							<div class="imgWrap">
								<a href="productView?product_no=${productDto.product_no}">
									<img alt="${productDto.product_thumbImg }" src="${pageContext.request.contextPath }/resources/upload/${productDto.product_thumbImg}" /> 
								</a>
							</div>	 
							<div class="txtWrap">							 
								<a href="productView?product_no=${productDto.product_no}">
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
								</a>
							</div>
						</div>
					</li>		  
					</c:forEach> 
				</ul>		 
			</div>
		</div>	
			
	</div>
	
	
	 
 	<div>
		생생한 리뷰 
	</div>   

	<div><!--------- 가로 배너 이미지  --------->
		<img alt="한끼도 특별하게, FOODIT" src="./resources/main/main1.jpg" style="width:100%; height:100%;">
	</div>
	
	<div><!--------- 푸딧 메뉴 보기 --------->
		
		<div>	
			<h2 class="singleTit nbgB">푸딧 메뉴보기</h2>  	 
			<span>
				당신을 위해 특별히 준비했어요.<br/>
				간편함은 물론, 완벽한 맛 푸딧이 다~ 했네
			</span>
			
			<table border="1" style="width:450px">
				<tbody>
					<c:forEach var="productDto" items="${menuList}" begin="1" end="12">				
					<tr>
						<td rowspan="3">
						<a href="productView?product_no=${productDto.product_no}">	 
							<img alt="${productDto.product_thumbImg }" 
							src="${pageContext.request.contextPath }/resources/upload/${productDto.product_thumbImg}" 
							style="width:150px; height:150px;" />
						</a>
						</td>	 		
					</tr>
					 <tr>
						<td>${productDto.product_name}</td>	 		
					</tr>
					 <tr>
						<td><fmt:formatNumber value="${productDto.product_price}" pattern="#,###,###" />원</td>	 		
					</tr>			 
					</c:forEach>
				</tbody>	
			</table>		 		
		</div>		 
		
	</div> 
	 
	 
	 
	 
	 
<script type="text/javascript" src="resources/js/slide.js"></script>	 
<%@ include file="/WEB-INF/views/common/footer.jsp" %> 