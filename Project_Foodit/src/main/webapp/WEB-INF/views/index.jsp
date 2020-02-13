
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
	 
 	<!--------- 실시간 베스트  --------->	
 	<div class="myBest"> 
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
	 
	<!--------- 가로 배너 이미지  --------->
	<div>
		<img alt="한끼도 특별하게, FOODIT" src="./resources/main/main1.jpg" style="width:100%; height:100%;">
	</div>
	
	<!--------- 푸딧 메뉴 보기 --------->
		
		<div class="myFoodit">	
			<div class="myFooditLwrap">
				<div class="mdsPick">
					<div class="imgMajor">
						<img src="./resources/images/mainImg1.jpg" style="width:100%">
					</div>
					<h2 class="nbgB">푸딧 메뉴보기</h2>  	 
					<span class="desc_txt">
						당신을 위해 특별히 준비했어요.<br/>
						간편함은 물론, 완벽한 맛 푸딧이 다~ 했네
					</span>
					<div class="mdsWrap">
						<ul>
							<c:forEach var="productDto" items="${menuList}" begin="1" end="6">				
							<li>
								<div class="mfWrap">
									<div class="mfimg">
										<a href="productView?product_no=${productDto.product_no}">	 
											<img alt="${productDto.product_thumbImg }" 
											src="${pageContext.request.contextPath }/resources/upload/${productDto.product_thumbImg}" 
											style="width:250px;" />
										</a>
									</div>
									<div class="mfTtxt">
										<div>
											<span class="strong mtElps">${productDto.product_name}</span>
										</div>
										<div>	 		
											<span><fmt:formatNumber value="${productDto.product_price}" pattern="#,###,###" />원</span>
										</div>
									</div>
								</div>
							</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>	
			<div class="myFooditRwrap">
				<div class="myFooditupCont">
					<div class="imgMajor">
						<img src="./resources/images/mainImg2.jpg" style="width:100%">
					</div>
					<h2 class="imgMajorTit">
						놓칠 수 없는 품질<br/>
						신선한 도시락
					</h2>
					<p class="imgMajorTxt">
						파격적인 가격으로<br/>
						푸딧을 경험할 수 있는 기회를 잡으세요.
					</p>
				</div>
				<div class="myFooditDownCont">
					<div class="imgMajor">
						<img src="./resources/images/mainImg3.jpg" style="width:100%">
					</div>
					<h2 class="imgMajorTit">
						직접 공수한 신선한<br/>
						재료로 만든 도시락
					</h2>
					<p class="imgMajorTxt">
						유기농 채소와 더불어<br/>
						고기의 신선한 풍미를 느껴보세요. 
					</p>
				</div>
			</div>	 		
		</div>		 
		
	 
	 
	 
	 
	 
<script type="text/javascript" src="resources/js/slide.js"></script>	 
<%@ include file="/WEB-INF/views/common/footer.jsp" %> 