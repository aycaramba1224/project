<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품->장바구니</title>
<script type="text/javascript">
	
</script>
</head>
<body>
	<div id="wrap">
		<table border=1>
			<c:choose>
			<c:when test="${productDto.pro_no eq null }">
				장바구니가 비어있습니다. <br />
				<input type="button" value="메뉴보러가기" onclick="location.href='productList'"/>
			</c:when>
			<c:otherwise>
			<tr>	
				<td><input type="checkbox" name="allCheck" id="allCheck"/></td>	 
				<td>상품명</td>
				<td>상품금액</td>
				<td>상품 수량</td>	
				<td>삭제</td>				
			</tr>
			<tr>
				<td><input type="checkbox" name="check" value="yes"/></td>
				<td>${productDto.pro_name }</td>
				<td>${productDto.pro_price }</td>
				<td>상품수량<%-- 처리예정 --%></td>
				<td><input type="button" value="x" onclick=""/></td>
			</tr>			
			<tr>
				<td colspan="5">
					<input type="button" value="선택 주문하기" onclick=""/> 
					<input type="button" value="전체 주문하기" onclick=""/> 
					<input type="button" value="상품 전체 삭제" onclick=""/>
					<input type="button" value="선택 상품 삭제" onclick=""/>
					<input type="button" value="상품 목록 이동" onclick="location.href='productList'"/>
				</td>
			</tr>
			</c:otherwise>
			</c:choose>
		</table>
	</div>
</body>
</html>