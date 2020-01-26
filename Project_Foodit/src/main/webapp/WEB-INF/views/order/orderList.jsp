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
     <body>
      <table>
	
			<tbody>
				<c:choose>
					<c:when test="${empty orderList }">
						<tr>
							<td colspan="4">작성된 주문정보가 없습니다.</td>
						</tr>
						</c:when>
					<c:otherwise>
				<c:forEach var="OrderBaseDto" items="${ orderList}">
				<tr>					
					<td>${ OrderBaseDto.order_no}</td>	
					<td>${ OrderBaseDto.order_name}</td>	
					<td>${ OrderBaseDto.order_post}</td>	
					<td>${ OrderBaseDto.order_road}</td>	
								
								
				</tr>
				</c:forEach>
				</c:otherwise>
				</c:choose>
							
			</tbody>
			
			<tr>
			<td colspan="4">	
				<input type="button" value="주문내역 보기" onclick="location.href=''"/>
			</td>					
				</tr>
   </table>
</body>
</html>