<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품->장바구니</title>
<script type="text/javascript">
	function selectDelete(){
		var check = confirm("정말 삭제할까요?");
		if (check) {
			location.href="productList";		
		}
	} 
	
</script>
</head>
<body>
	<div id="wrap">
	ㅇㅇ
	<%-- 	<table border=1>
		<c:forEach var="productDto" items="${cartView }">
		<c:choose>
			<c:when test="${productDto.pro_no ne null }">
			<tr>	
				<td><input type="checkbox" name="allCheck"/>전체선택</td>	 
				<td>상품명</td>
				<td>상품금액</td>
				<td>상품 수량</td>	
				<td>삭제</td>				
			</tr>
			<tr>
				<td><input type="checkbox" name="check" value="yes"/></td>
				<td><a href="productView?pro_no=${productDto.pro_no}">${productDto.pro_name }</a></td>
				<td>${productDto.pro_price }</td>
				<td>${param.cartCount }</td>
				<td><input type="button" value="x" onclick="selectDelete()"/></td>
			</tr>			
			<tr>
				<td colspan="5">
					<input type="button" value="선택 주문하기" onclick="selectOrder(this.form)"/> 
					<input type="button" value="전체 주문하기" onclick="allOrder(this.form)"/> 
					<input type="button" value="선택 상품 삭제" onclick=""/>
					<input type="button" value="상품 목록 이동" onclick="location.href='productList'"/>
				</td>
			</tr>
				</c:when>
				<c:otherwise>
			
			<tr>
				<td>장바구니가 비어있습니다.</td>
				<td><input type="button" value="메뉴보러가기" onclick="location.href='productList'"/></td>
			</tr>	
				</c:otherwise>
		 
				</c:choose>			
			</c:forEach>
		</table> --%>
	</div>
</body>
</html>