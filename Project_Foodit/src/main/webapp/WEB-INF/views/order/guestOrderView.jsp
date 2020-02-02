<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post"  name="f">
	       <h1>주문자 정보</h1>
			<table border="1">
				<tbody>
					<tr>
						<td>주문번호</td>
						<td>
							${orderBaseDto.order_no }
						</td>
					</tr>
					  
					 <tr>
					 <td>주문비밀번호</td>
					 <td>
					 ${orderBaseDto.guest_pw }
					 </td>
					 </tr>
					 
					<tr>
						<td>주문자이름</td>
						<td>
						${orderBaseDto.order_name}
						</td>
					</tr>
					
					<tr>
						<td>휴대폰</td>
						<td>
						${orderBaseDto.order_phone}-
						${orderBaseDto.order_phone2}-
						${orderBaseDto.order_phone3}
						</td>
					</tr>
					
					<tr>
						<td>이메일</td>
						<td>
						${orderBaseDto.order_email}@
						${orderBaseDto.order_email2}
						</td>
					</tr>

					</tbody>
					</table>
					<h1>배송정보</h1>
					<table border="1">
					<tbody>
					 <tr>
						<td>배송자이름</td>
						<td>
						${orderBaseDto.delivery_name}
						</td>
					</tr>
					
					<tr>
						<td>배송자휴대폰</td>
						<td>
						${orderBaseDto.delivery_phone}-
						${orderBaseDto.delivery_phone2}-
						${orderBaseDto.delivery_phone3}
						</td>
					</tr>
				
					<tr>
						<td>우편번호</td>
						<td>
				       ${orderBaseDto.order_post}
                         </td>
					</tr>
					
					<tr>
				    <td>주소</td>
				    <td>
		              ${orderBaseDto.order_road1}
		          </td>
					</tr>
				
					<tr>
					<td>
					  ${OrderBaseDto.orderDate}
					</td>
					</tr>
					</tbody>
					</table>
					</form>

</body>
</html>