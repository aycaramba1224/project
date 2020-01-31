<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta  content="text/html; charset=UTF-8">
<title>비회원 로그인 </title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">

	
	</script>
</head>
<body> 
<h1>비회원 주문페이지</h1>
 <form  method="post" action="guestInsert">
		<table border="1">
			<tbody>
				<tr>
				   
					<td>비회원주문번호</td>
					<td><input type="text" name="guest_no" id="guest_no" placeholder="※10자이상 숫자"/>
					
					</td>
				</tr>
					
					<tr>
						<td>비회원주문비밀번호</td>
				<td><input type="text" name="guest_pw"  id ="guest_pw" placeholder="※8-16자 소문자+숫자" /></td>
								
					</tr>
					
					<tr>
						<td>비회원이름</td>
						<td><input type="text" name="guest_name"  id="guest_name"/></td>
					</tr>
					
					<tr>
						<td>비회원연락처</td>
				<td><input type="text" name="guest_phone" id="guest_phone"/></td>
					    </tr>
			
            <tr>
			<td colspan="4">
	     <input type="submit" value="주문하기"/>
	     
	    <!-- 관리자페이지 -->
	     <input type="button"value="비회원주문 정보보기" onclick="location.href='guestList'" />
			</td>
			</tr>
			</tbody>
	</table>
	</form>

</body>
</html>