<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니 목록 </title>
</head>
<body>
	<div id="wrap">
		<table border=1>
			<tbody>
				<tr>
					<td>
			 		카트 ${cartDto.pro_no}
			 		상품 ${productDto.pro_no }
			 		</td>
				 </tr>
		 		<c:choose>
		 			<c:when test="${cartDto.pro_no eq productDto.pro_no}">
		 			 <tr>
		 			 	<td>
		 			 		상품번호 카트 : ${cartDto.pro_no }
		 			 		상품번호 상품 : ${productDto.pro_no }
		 			 	</td>
		 			 </tr>
		 			</c:when>
		 			<c:otherwise>
		 			몰라
		 			</c:otherwise>
		 		</c:choose>
				<c:if test="${cartDto.pro_no eq null}">
				<tr>
					<td colspan="3">장바구니가 비었습니다.</td>
				</tr>	
				</c:if>	
				 <c:if test="${cartDto.pro_no eq productDto.pro_no}">
				<tr>
					<td colspan="3">ddd</td>
				</tr>	
				</c:if>	
				
					<%-- <c:forEach var="productDto" items="${cartList }">
					<tr>
						<td>상품번호</td>
						<td>${productDto.pro_no }</td>
					</tr>
					<tr>
						<td>상품명</td>
						<td>${productDto.pro_name }</td>
					</tr>
					<tr>
						<td>상품금액</td>
						<td>${productDto.pro_price }</td>
					</tr>
					</c:forEach> --%>
				
			</tbody>
		</table>
	</div>
</body>
</html>