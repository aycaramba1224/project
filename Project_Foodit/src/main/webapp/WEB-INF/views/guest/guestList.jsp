<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta  content="text/html; charset=UTF-8">
<title>비회원 리스트 </title>
<title>Insert title here</title>
 <script>
var  guestInsertResult = "${guestInsertResult}";
if( guestInsertResult == "yes"){
	var guestResult= "${guestResult}";
	if(guestResult == 0){
		alert("비회원 정보 등록 실패.");
	} else {
		alert("비회원 등록 성공.");
	}
}

var guestDeleteResult = "${guestDeleteResult}";
if( guestDeleteResult == "yes"){
	var deleteResult = "${deleteResult}";
	if(deleteResult== 0){
		alert("비회원정보 삭제 실패.");
	} else {
		alert("비회원정보 삭제 성공.");
	}
}

var guestModifyResult = "${guestModifyResult}";
if( guestModifyResult == "yes"){
	var guestMOResult = "${guestMOResult}";
	if(guestMOResult== 0){
		alert("비회원정보 수정 실패.");
	} else {
		alert("비회원정보 수정 성공.");
	}
}




</script>
</head>
<body>
   <form method="post">
		<table border="1">
		<tbody>
					
	   <tr>
			<th>비회원주문번호</th>
			<th>비회원 주문비밀번호</th>
			<th>비회원 이름</th>
			<th>비회원 연락처</th>
		</tr>
	
		<c:if test="${guestListSize eq 0 }">
			<tr>
				<td colspan="5">저장된 비회원정보가 없습니다.</td>
			</tr>
		</c:if>
		
		<c:if test="${ guestListSize ne 0 }">
			<c:forEach var="GuestDto" items="${guestList}">
				<tr>
					<td><a href="guestListview?guest_id=${GuestDto.guest_id}">${GuestDto.guest_id}</a></td>
					<td>${GuestDto.guest_pw}</td>
					<td>${GuestDto.guest_name}</td>
					<td>${GuestDto.guest_phone}</td>
				</tr>
			</c:forEach>
		</c:if>
		</tbody>
		<tr>
			<th colspan="6">
				전체 주문에대한정보(${guestListSize })개&nbsp;&nbsp;
		      </th>
		      </tr>

			</tbody>

			</table>
			<input type="button" value="비회원작성하기" onclick="location.href='guestInsertPage'" />

			</form>

</body>
</html>