<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
    
<jsp:include page="/WEB-INF/views/common/header.jsp" >
	<jsp:param value="FOODIT 장바구니" name="title"/>
</jsp:include> 
 	
 	<div id="cartWrap">
	 	<div class="cartTitWrap">
			<h2 class="cartTit">장바구니</h2>
	 	</div>
	 	 
		<div class="nomem_login">
 		   	<c:if test="${mDto.id eq null }">
 				<p>로그인을 하시면 장바구니에 담긴 상품을 나중에도 확인하실 수 있습니다.</p>
 				<button type="button" onclick="location.href='sbmr'">로그인</button>		 		 
 		 	</c:if>    
		</div> 		 
		
		<div class="detail">
			<div class="detail_info">
				<div class="no_data">
					<span class="ico"></span>
					<p>장바구니에 담긴 메뉴가 없습니다.</p>
					<span>다양한 맛을 가진 메뉴를 확인해 보세요.</span>
					<a href="productList" class="rec_link">
						<span>메뉴보러 가기</span>
					</a>
				</div>
			</div>
		</div>
	</div>			
				
		 
<%@ include file="/WEB-INF/views/common/footer.jsp" %>