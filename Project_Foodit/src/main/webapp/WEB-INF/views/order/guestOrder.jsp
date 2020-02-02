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
			<c:choose>
			<c:when test="${OrderDto eq null }">
				<tbody>
				<tr>
				<td>
				해당정보가 없습니다.
				</td>
				</tr>
					</tbody>
			</c:when>
			<c:otherwise>
			<tr>
			<td>
			     ${OrderDto.guest_pw}
			</td>
			</tr>
					</c:otherwise>
					
					</c:choose>
					</table>
				
		
		</form>

</body>
</html>