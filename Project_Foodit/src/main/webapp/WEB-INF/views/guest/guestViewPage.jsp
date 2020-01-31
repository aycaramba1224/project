<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function guestDelete(){
	if (confirm("정말 삭제할까요?")) {
		location.href='guestDelete?guest_id=${guestDto.guest_id}';
	}
}

</script>
</head>
<body>

	<form method="post" action="guestModify">
			<table border="1">
				<tbody>
					<tr>
						<td>비회원주문번호
							${guestDto.guest_id }
							<input type="hidden" name="guest_id" value="${guestDto.guest_id}" size="20"/>
						</td>
					</tr>
					<tr>
						<td>비회원비밀번호
						<input type="text" name="guest_pw" value="${guestDto.guest_pw}"/></td>
					</tr>
					<tr>
						<td>비회원이름
						<input type="text" name="guest_name" value="${guestDto.guest_name}" />
						</td>
					</tr>
					 <tr>
						<td>비회원이름
						<input type="text" name="guest_phone" value="${guestDto.guest_phone}" />
						</td>
					</tr>
					
				
					<tr>
						<td colspan="2">
	
						    <input type="button" value="비회원 정보보기" onclick="location.href='guestList'" />
						    <input type="submit" value="비회원 정보 수정">
							<input type="button" value="비회원정보삭제" onclick="guestDelete()" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>
</body>
</html>