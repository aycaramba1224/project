<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
    
    
<jsp:include page="/WEB-INF/views/common/header.jsp" >
	<jsp:param value="FOODIT 장바구니" name="title"/>
</jsp:include> 
 
	
	<span>장바구니</span>
 	
 	<div id="wrap">
 	
		<div id="비 로그인시 안내문">
 		   	<c:if test="${mDto.id eq null }">
 				로그인을 하시면 장바구니에 담긴 상품을 나중에도 확인하실 수 있습니다.&nbsp;&nbsp;&nbsp;
 				<input type="button" value="로그인" onclick="location.href='sbmr'"/>		 		 
 		 	</c:if>    
		</div> 		 
			
		<br/><br/>
	
		<span>장바구니에 담긴 메뉴가 없습니다.</span><br/>
		<span>다양한 맛을 가진 메뉴를 확인해 보세요.</span><br/>
		<input type="button" value="메뉴보러가기" onclick="location.href='productList'"/>
	</div>			
				
		 
<%@ include file="/WEB-INF/views/common/footer.jsp" %>