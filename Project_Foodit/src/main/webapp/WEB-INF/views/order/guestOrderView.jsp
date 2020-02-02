<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
    h1{
    text-align: center;
    margin-bottom: 20px;
    }
*{
   margin:0;
   padding:0;
   }
   table {
    border-collapse: collapse;
    margin:auto;
    border-top: 1px solid #444444;
    width:500px;
    text-align:center;
    border-radius:50px;
    font-size: 20px;
   }
     .td1{
      background-color: lightgray;
      color:black;
     }
   td {
   border-bottom: 1px solid #444444;
    padding: 10px;
   font-size:12px;
   border-bottom: 1px solid #444444;
 }
	.tr1:nth-child(odd) {
   background-color : #66cc00;
}
	.pro-order{
	     width:500px;
	     border: 1px solid black; 
	     height:300px;
	     margin:auto;
	     }
  .order-div, .pro-div ,.del-div {
  margin-top: 20px;
  }

</style>
</head>
<body>
<form method="post"  name="f">
			<div class="order-div">
	       <h1>주문자 정보</h1>
	       </div>
			<table border="1">
				<tbody>
					<tr>
						<td class="td1">주문번호</td>
						<td>
							${orderBaseDto.order_no }
						</td>
					</tr>
					  
					 <tr>
					 <td class="td1">주문비밀번호</td>
					 <td>
					 ${orderBaseDto.guest_pw }
					 </td>
					 </tr>
					 
					<tr>
						<td class="td1">주문자이름</td>
						<td>
						${orderBaseDto.order_name}
						</td>
					</tr>
					
					<tr>
						<td class="td1">휴대폰</td>
						<td>
						${orderBaseDto.order_phone}-
						${orderBaseDto.order_phone2}-
						${orderBaseDto.order_phone3}
						</td>
					</tr>
					
					<tr>
						<td class="td1">이메일</td>
						<td>
						${orderBaseDto.order_email}@
						${orderBaseDto.order_email2}
						</td>
					</tr>

					</tbody>
					</table>
					<div class="pro-div">
					<h1>상품정보</h1>
					</div>
					<div class="pro-order">
					
					
					</div>
					<div class="del-div">
					<h1>배송정보</h1>
					</div>
					<table border="1">
					<tbody>
					 <tr>
						<td class="td1">배송자이름</td>
						<td>
						${orderBaseDto.delivery_name}
						</td>
					</tr>
					
					<tr>
						<td class="td1">배송자휴대폰</td>
						<td>
						${orderBaseDto.delivery_phone}-
						${orderBaseDto.delivery_phone2}-
						${orderBaseDto.delivery_phone3}
						</td>
					</tr>
				
					<tr>
						<td class="td1">우편번호</td>
						<td>
				       ${orderBaseDto.order_post}
                         </td>
					</tr>
					
					<tr>
				    <td class="td1">주소</td>
				    <td>
		              ${orderBaseDto.order_road1}
		          </td>
					</tr>
				 <!-- 
					<tr>
					<td>
					  ${OrderBaseDto.orderDate}
					</td>
					</tr>
					-->
					</tbody>
					</table>
					</form>

</body>
</html>