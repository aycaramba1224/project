<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var orderInsertResult = "${orderInsertResult}";
	if( orderInsertResult == "yes"){
		var orderResult= "${orderResult}";
		if(orderResult == 0){
			alert("주문 정보 등록 실패.");
		} else {
			alert("주문정보 등록 성공.");
		}
	}
	
	var orderBaseModifyResult = "${orderBaseModifyResult}";
	if( orderBaseModifyResult == "yes"){
		var orderModifyResult= "${orderModifyResult}";
		if(orderModifyResult == 0){
			alert("주문 정보 수정 실패.");
		} else {
			alert("주문정보 수정 성공.");
		}
	}
	
	var orderDeleteResult = "${orderDeleteResult}";
	 if( orderDeleteResult == "yes"){
			var deleteResult = "${deleteResult}";
			if(deleteResult== 0){
				alert("주문정보 삭제 실패.");
			} else {
				alert("주문정보 삭제 성공.");
			}
		}

</script>
</head>
<body>
     <body>
      <table border="1">
 
			<tbody>
					
				<tr>
			<th>주문번호</th>
			<th>주문자아이디</th>
			<th>주문자이름</th>
			<th>우편번호</th>
			<th>주소</th>
			
		
		</tr>
	
		<c:if test="${orderBaseListSize eq 0 }">
			<tr>
				<td colspan="5">저장된 주문정보가 없습니다.</td>
			</tr>
		</c:if>
		
		<c:if test="${ orderBaseListSize ne 0 }">
			<c:forEach var="OrderBaseDto" items="${orderBaseList}">
				<tr>
					<td>${OrderBaseDto.order_no}</td>
					<td><a href="orderbaseListview?order_no=${OrderBaseDto.order_no}">${OrderBaseDto.order_id }</a></td>
					<td>${OrderBaseDto.order_name}</td>
					<td>${OrderBaseDto.order_post}</td>
					<td>${OrderBaseDto.order_road}</td>
					
					
				</tr>
			</c:forEach>
		</c:if>
		</tbody>
		<tr>
			<th colspan="6">
				전체 주문에대한정보(${orderBaseListSize })개&nbsp;&nbsp;
		      </th>
		      </tr>
		     
			<tr>
			<td colspan="5">	
		       <input type="button" value="주문정보입력" onclick="location.href='orderInsertPage'"/>
			</td>					
				</tr>
   </table>
</body>
</html>