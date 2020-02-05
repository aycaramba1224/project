<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역 페이지</title>
<script>
//비회원일떄!기본!

var orderBaseModifyResult = "${orderBaseModifyResult}";
if( orderBaseModifyResult == "yes"){
	var orderModifyResult= "${orderModifyResult}";
	if(orderModifyResult == 0){
		alert("주문 정보 수정 실패.");
	} else {
		alert("주문정보 수정성공.");
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
<h1>주문자 정보 페이지</h1>
	        <form>
 		<c:choose>
	        <c:when test="${ mDto eq null }">
      <table border="1">
			<tbody>
					
				<tr>
			<th>주문번호</th>
		    <th>주문자 비밀번호</th> 
			<th>주문자이름</th>
			<th>주문자 휴대폰</th>
			<th>주문자 이메일</th>
			</tr>
		
		<c:if test="${ orderBaseListSize ne 0 }">
			<c:forEach var="OrderBaseDto" items="${orderBaseList}">
				<tr>
				    <td>${OrderBaseDto.order_no}</td>
				    <td>${OrderBaseDto.guest_pw}</td>
					<td><a href="orderbaseListview?order_name=${OrderBaseDto.order_name}">${OrderBaseDto.order_name}</a></td>
					<td>${OrderBaseDto.order_phone}-${OrderBaseDto.order_phone2}-${OrderBaseDto.order_phone3}</td>
					<td>${OrderBaseDto.order_email}@${OrderBaseDto.order_email2}</td>
				</tr>
			</c:forEach>
		</c:if>
			<c:if test="${orderBaseListSize eq 0 }">
			<tr>
				<td colspan="5">저장된 주문정보가 없습니다.</td>
			</tr>
		</c:if>
		</tbody>
   </table>
    
    <h1>배송정보</h1>
    <table border="1">
    <tbody>
			<tr>
			<th>배송자이름</th>
			<th>배송자휴대폰</th>
			<th>우편번호</th>
			<th>주소</th>
			<th>주문날짜</th>
		   </tr>
		   
		   <c:if test="${ orderBaseListSize ne 0 }">
			<c:forEach var="OrderBaseDto" items="${orderBaseList}">
			
				<tr>
					
				    <td>${OrderBaseDto.delivery_name}</td>
				    <td>${OrderBaseDto.delivery_phone}-${OrderBaseDto.delivery_phone2}-${OrderBaseDto.delivery_phone3}</td>
				    <td>${OrderBaseDto.order_post}</td>
					<td>${OrderBaseDto.order_road1}</td>
					<td>${OrderBaseDto.orderDate }</td>
				</tr>
				</c:forEach>
				
		</c:if>
		
		
		<c:if test="${orderBaseListSize eq 0 }">
			<tr>
				<td colspan="5">저장된 배송정보가 없습니다.</td>
			</tr>
		</c:if>
		</tbody>
		<tfoot>
		     <tr>
			<th colspan="5">
				전체 주문에대한정보(${orderBaseListSize })개&nbsp;&nbsp;
		     </th>
		     </tr>
		     <tr>
		     
		     <th>
			 <input type="button" value="주문하기페이지로" onclick="location.href='orderInsertPage'"/>
			 </th>
			 </tr>
		</tfoot>
		</table>
		</c:when>
		</c:choose>
		</form>
</body>
</html>