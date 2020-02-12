<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
 
	<div>	
	
		<h3>푸딧 메뉴보기</h3>	
		<span>
			당신을 위해 특별히 준비했어요.<br/>
			간편함은 물론, 완벽한 맛 푸딧이 다~ 했네
		</span>
		
		<table border="1" style="width:450px">
			<c:forEach var="productDto" items="${menuList}" begin="1" end="12">	
			<a href="productView?product_no=${productDto.product_no}">	 
			<tr>
				<td rowspan="3">
					<img alt="${productDto.product_thumbImg }" 
					src="${pageContext.request.contextPath }/resources/upload/${productDto.product_thumbImg}" 
					style="width:150px; height:150px;" />
				</td>	 		
			</tr>
			 <tr>
				<td>${productDto.product_name}</td>	 		
			</tr>
			 <tr>
				<td><fmt:formatNumber value="${productDto.product_price}" pattern="#,###,###" />원</td>	 		
			</tr>
			</a>
			</c:forEach>
		</table>	 
		 		
	</div>
