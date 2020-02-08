<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<jsp:include page="/WEB-INF/views/common/header.jsp" />



	<div>
 		메인 이미지 슬라이드  	
 	</div> <br/>
	
	<div> <!-- 맛추천  -->
		 	
		<select	name="product_taste">
			<option value="매콤한맛">매콤한맛</option>
			<option value="짭짤한맛">짭짤한맛</option>
			<option value="담백한맛">담백한맛</option>
			<option value="이국적인맛">이국적인맛</option>
			<option value="얼큰한맛">얼큰한맛</option>
		</select> <br/> 
		 <h3> 메뉴  <br/> 추천 드려요.</h3>
		 <span>
		 	<a>로그인</a>하시면 고객님의 구매내역과 <br/>
			맛취향에 따라 딱맞는 맛있는 메뉴를 추천드려요.
		</span>
	 
	</div> <br/>
	
	<div>
		실시간 베스트	 <!-- 임시  -->
		<jsp:include page="/WEB-INF/views/product/searchResult.jsp"/>
			
	</div>	<br/>
	
	
	
	<div>
		생생한 리뷰 
	</div>  
	
	
	
	
	 
















<%@ include file="/WEB-INF/views/common/footer.jsp" %>