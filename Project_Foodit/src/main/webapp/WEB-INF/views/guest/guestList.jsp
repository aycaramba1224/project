<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form  method="POST">
		<table border="1">
		<tbody>
		<c:choose>
					<c:when test="${empty guestList }">
						<tr>
							<td colspan="4">작성된 비회원정보가 없습니다.</td>
						</tr>
						</c:when>
					<c:otherwise>
				<c:forEach var="GuestDto" items="${guestList}">
				<tr>					
					<td>${ GuestDto.guest_no}</td>	
					<td>${ GuestDto.guest_pw}</td>	
					<td>${ GuestDto.guest_name}</td>	
					<td>${ GuestDto.guest_phone}</td>	
								
								
				</tr>
				</c:forEach>
				</c:otherwise>
				</c:choose>

			</tbody>

			</table>
			<input type="button" value="비회원작성하기" onclick="location.href='guestInsertPage'" />
			</form>

</body>
</html>