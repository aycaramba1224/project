<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<form method="post"  name="f">
	       <h1>주문자 정보</h1>
			<table border="1">
			<c:if test="${ guest_noListSize ne 0 }">
			<c:if test="${ guestListSize ne 0 }">
			<c:forEach var="OrderBaseDto" items="${guestList}">
			<c:forEach var="OrderBaseDto" items="${guest_noList}">
			<tr>
			<td>
			비회원 주문번호
			</td>
			<td>
			 
	  <a href="guestOderListview?order_no=${OrderBaseDto.order_no}">${OrderBaseDto.order_no}</a>
			</td>
			</tr>
			
			<tr>
			<td>
			비회원 비밀번호
			</td>
			<td>
			   ${OrderBaseDto.guest_pw}
			</td>
			</tr>
					</tbody>
			</c:forEach>
			</c:forEach>
			</c:if>
			</c:if>
			
			<c:if test="${ guest_noListSize eq 0 }">
			<c:if test="${guestListSize eq 0 }">
		
			<tr>
				<td colspan="5">저장된 주문정보가 없습니다.</td>
			</tr>
		
				</c:if>
		</c:if>	
	</table>
		</form>
		
		
		
				

</body>
</html>