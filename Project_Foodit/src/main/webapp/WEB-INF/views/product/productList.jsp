 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 목록</title>
<script type="text/javascript">
	var isProductModify = "${isProductModify}";
	if(isProductModify == "yes"){
		var modifyResult = "${modifyResult}";
		if(modifyResult == 0){
			alert("상품 수정이 실패하였습니다.");
		} else {
			alert("상품 수정이 성공하였습니다.");
		}
	} 
		var isProductInsert = "${isProductInsert}";
	if(isProductInsert == "yes"){
		var insertResult = "${insertResult}";
		if(insertResult == 0){
			alert("상품 등록이 실패하였습니다.");
		} else {
			alert("상품 등록이 성공하였습니다.");
		}
	}
	var isProductDelete = "${isProductDelete}";
	if(isProductDelete == "yes"){
		var deleteResult ="${deleteResult}";
		if(deleteResult == 0 ){
			alert("상품 삭제가 실패하였습니다.");
		} else {
			alert("상품 삭제가 성공하였습니다.");	
		}
	}	
</script>
</head>
<body>
	<div id="wrap">
		<h3>상품 전체 목록</h3>
	<!-- 	<div id="search">
			<form action="dynamicQuery" method="POST">
				검색 
				<select name="query">
					<option value="PRO_NO">상품번호</option>
					<option value="PRO_NAME">상품명</option>
					<option value="PRO_TASTE">맛</option>
				</select>
				<input type="text" name="content"/>
				<input type="submit" value="검색">
			</form>	
		</div> -->
		<table border="1">
			<thead>
				<tr>
					<td>상품번호</td>
					<td>상품명</td>
					<td>상품금액</td>				 			
				</tr>
			</thead>
			<tbody>
				<c:if test="${productListSize eq 0 }">
				<tr>
					<td colspan="3">등록된 상품이 없습니다.</td>					
				</tr>				
				</c:if>
				<c:forEach var="productDto" items="${productList }">
				<tr>					
					<td>${productDto.pro_no }</td>
					<td><a href="productView?pro_no=${productDto.pro_no}">${productDto.pro_name}</a></td>
					<td>${productDto.pro_price }</td>					
				</tr>
				</c:forEach>
				<tr>
					<td colspan="3">총 상품 개수 : ${productListSize }개</td>
				</tr>				
			</tbody>
			<tfoot>
			<!-- 관리자만 보이는 부분  (처리예정)-->
				<tr>
					<td colspan="3">	
						<input type="button" value="상품등록" onclick="location.href='productInsertPage'"/>
					</td>					
				</tr>
			</tfoot>
			<!-- 관리자만 보이는 부분  (처리예정)-->
		</table>	
	</div>
	
</body>

</html>