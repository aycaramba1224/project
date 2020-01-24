<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비회원 로그인 페이지</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#btn").click(function(){
				$.ajax({
					url: "jsonGet",
					method: "GET",
					success: function(jsonObj){
						var obj = jsonObj;
						$("#content").html("<h1>비회원주문번호 : " + obj["guest_no"] + ", 비회원비밀번호 : " + obj.guest_pw + ",비회원이름:"+obj.guest_name+",비회원폰번호:"+obj.guest_phone+"</h1>");
					}
				}); // end ajax
			}); // end click
		}); // end 페이지 로드
	</script>
</head>
<body> 
     
		<table border="1">
			<tbody>
				<tr>
					<td>비회원주문번호</td>
					<td><input type="text" name="guest_no"/></td>
				</tr>
					
					<tr>
						<td>비회원주문비밀번호</td>
						<td><input type="text" name="guest_pw" /></td>
					</tr>
					
					<tr>
						<td>비회원이름</td>
						<td><input type="text" name="guest_name" /></td>
					</tr>
					
					<tr>
						<td>비회원연락처</td>
					     <td><input type="text" name="guest_phone" /> </td>
				    </tr>
			

			<td colspan="4">
	     <input type="button" id="btn" value="보내기"/>
	     <div id="content"></div>
			</td>
			</tbody>
	</table>
	

</body>
</html>